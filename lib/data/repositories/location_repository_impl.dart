import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/errors/failures.dart';
import '../../core/utils/distance_calculator.dart';
import '../../domain/entities/location_entity.dart';
import '../models/location_data_model.dart';
import '../datasources/location_local_datasource.dart';

abstract class LocationRepository {
  Future<LocationEntity> getCurrentLocation();
  Future<bool> requestLocationPermission();
  Future<bool> isLocationServiceEnabled();
  Future<void> saveLocationData(LocationEntity location);
  Future<List<LocationEntity>> getAllLocationData();
  Future<void> clearLocationData();
  Future<double> calculateDistance(LocationEntity from, LocationEntity to);
}

class LocationRepositoryImpl implements LocationRepository {
  final LocationLocalDataSource _localDataSource;

  LocationRepositoryImpl(this._localDataSource);

  @override
  Future<LocationEntity> getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );

      return LocationEntity(
        latitude: position.latitude,
        longitude: position.longitude,
        timestamp: DateTime.now(),
      );
    } on TimeoutException catch (e) {
      print('Location timeout: $e');
      throw LocationFailure('Location request timed out. Please try again.');
    } catch (e) {
      print('Location error: $e');
      throw LocationFailure('Failed to get current location: $e');
    }
  }

  @override
  Future<bool> requestLocationPermission() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<void> saveLocationData(LocationEntity location) async {
    try {
      final model = LocationDataModel(
        latitude: location.latitude,
        longitude: location.longitude,
        timestamp: location.timestamp,
        distance: location.distance,
      );
      await _localDataSource.saveLocationData(model);
    } catch (e) {
      throw StorageFailure('Failed to save location data: $e');
    }
  }

  @override
  Future<List<LocationEntity>> getAllLocationData() async {
    try {
      final models = await _localDataSource.getAllLocationData();
      return models
          .map(
            (model) => LocationEntity(
              latitude: model.latitude,
              longitude: model.longitude,
              timestamp: model.timestamp,
              distance: model.distance,
            ),
          )
          .toList();
    } catch (e) {
      throw StorageFailure('Failed to get location data: $e');
    }
  }

  @override
  Future<void> clearLocationData() async {
    try {
      await _localDataSource.clearLocationData();
    } catch (e) {
      throw StorageFailure('Failed to clear location data: $e');
    }
  }

  @override
  Future<double> calculateDistance(
    LocationEntity from,
    LocationEntity to,
  ) async {
    return DistanceCalculator.calculateDistance(
      from.latitude,
      from.longitude,
      to.latitude,
      to.longitude,
    );
  }
}
