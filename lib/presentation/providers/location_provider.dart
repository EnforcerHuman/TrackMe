import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/location_entity.dart';
import '../../domain/usecases/track_location_usecase.dart';

class LocationState {
  final bool isTracking;
  final bool isLoading;
  final String? error;
  final List<LocationEntity> locations;
  final double totalDistance;
  final LocationEntity? startLocation;
  final LocationEntity? currentLocation;

  const LocationState({
    this.isTracking = false,
    this.isLoading = false,
    this.error,
    this.locations = const [],
    this.totalDistance = 0.0,
    this.startLocation,
    this.currentLocation,
  });

  LocationState copyWith({
    bool? isTracking,
    bool? isLoading,
    String? error,
    List<LocationEntity>? locations,
    double? totalDistance,
    LocationEntity? startLocation,
    LocationEntity? currentLocation,
  }) {
    return LocationState(
      isTracking: isTracking ?? this.isTracking,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      locations: locations ?? this.locations,
      totalDistance: totalDistance ?? this.totalDistance,
      startLocation: startLocation ?? this.startLocation,
      currentLocation: currentLocation ?? this.currentLocation,
    );
  }
}

class LocationNotifier extends ChangeNotifier {
  final TrackLocationUseCase _useCase;
  LocationState _state = const LocationState();

  StreamSubscription<Position>? _positionStreamSubscription;

  LocationNotifier(this._useCase);

  LocationState get state => _state;

  Future<void> startTracking() async {
    try {
      _state = _state.copyWith(isLoading: true, error: null);
      notifyListeners();

      // Checking if location service is enabled
      final isServiceEnabled = await _useCase.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        _state = _state.copyWith(
          isLoading: false,
          error: 'Location service is disabled. Please enable it in settings.',
        );
        notifyListeners();
        return;
      }

      // Requesting permission
      final hasPermission = await _useCase.requestLocationPermission();
      if (!hasPermission) {
        _state = _state.copyWith(
          isLoading: false,
          error:
              'Location permission denied. Please grant permission to continue.',
        );
        notifyListeners();
        return;
      }

      // Get current location
      final currentLocation = await _useCase.getCurrentLocation();

      // Clear previous data
      await _useCase.clearLocationData();

      // Save first location
      await _useCase.saveLocationData(currentLocation);

      _state = _state.copyWith(
        isTracking: true,
        isLoading: false,
        startLocation: currentLocation,
        currentLocation: currentLocation,
        locations: [currentLocation],
        totalDistance: 0.0,
        error: null,
      );
      notifyListeners();

      _startLocationStream();
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        error: e is Failure ? e.message : 'Failed to start tracking: $e',
      );
      notifyListeners();
    }
  }

  Future<void> stopTracking() async {
    try {
      _state = _state.copyWith(isLoading: true, error: null);
      notifyListeners();

      // Get all location data
      final locations = await _useCase.getAllLocationData();

      if (locations.isEmpty) {
        _state = _state.copyWith(
          isLoading: false,
          error: 'No location data found',
        );
        notifyListeners();
        return;
      }

      _state = _state.copyWith(
        isTracking: false,
        isLoading: false,
        locations: locations,
        error: null,
      );
      notifyListeners();

      _stopLocationStream();
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        error: e is Failure ? e.message : 'Failed to stop tracking: $e',
      );
      notifyListeners();
    }
  }

  /// Update location data from GPS stream
  Future<void> updateLocation() async {
    if (!_state.isTracking) return;

    try {
      final currentLocation = await _useCase.getCurrentLocation();
      final previousLocation = _state.currentLocation;

      double distance = 0.0;
      if (previousLocation != null) {
        distance = await _useCase.calculateDistance(
          previousLocation,
          currentLocation,
        );
      }

      // Create location with distance
      final locationWithDistance = LocationEntity(
        latitude: currentLocation.latitude,
        longitude: currentLocation.longitude,
        timestamp: currentLocation.timestamp,
        distance: distance,
      );

      // Save location data
      await _useCase.saveLocationData(locationWithDistance);

      // Update state - limit locations array to prevent memory issues
      final newLocations = [..._state.locations, locationWithDistance];
      final limitedLocations =
          newLocations.length > 1000
              ? newLocations.skip(newLocations.length - 1000).toList()
              : newLocations;

      final newTotalDistance = _state.totalDistance + distance;

      _state = _state.copyWith(
        currentLocation: currentLocation,
        locations: limitedLocations,
        totalDistance: newTotalDistance,
      );
      notifyListeners();
    } catch (e) {
      print('Error in updateLocation: $e');
      _state = _state.copyWith(
        error: e is Failure ? e.message : 'Failed to update location: $e',
      );
      notifyListeners();
    }
  }

  void clearError() {
    _state = _state.copyWith(error: null);
    notifyListeners();
  }

  void _startLocationStream() {
    _positionStreamSubscription?.cancel();

    _positionStreamSubscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen(
      (Position position) => updateLocation(),
      onError: (error) {
        print('Location stream error: $error');
        _state = _state.copyWith(error: 'Location stream error: $error');
        notifyListeners();
      },
      cancelOnError: false,
    );
  }

  void _stopLocationStream() {
    _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
    super.dispose();
  }
}
