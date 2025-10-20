import 'package:flutter/foundation.dart';
import 'package:trackme/data/models/TripMoodel.dart';
import '../../domain/usecases/trip_history_usecase.dart';

class TripHistoryNotifier extends ChangeNotifier {
  final TripHistoryUseCase _useCase;

  TripHistoryNotifier(this._useCase);

  List<TripModel> _trips = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  List<TripModel> get trips => _trips;
  bool get isLoading => _isLoading;
  String? get error => _error;
  int get tripCount => _trips.length;
  double get totalDistance =>
      _trips.fold(0.0, (sum, trip) => sum + trip.totalDistance);

  /// Load all trips from storage
  Future<void> loadTrips() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _trips = await _useCase.getAllTrips();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to load trips: $e';
      notifyListeners();
    }
  }

  /// Save a new trip
  Future<void> saveTrip(TripModel trip) async {
    try {
      await _useCase.saveTrip(trip);
      _trips.insert(0, trip);
      notifyListeners();
    } catch (e) {
      _error = 'Failed to save trip: $e';
      notifyListeners();
    }
  }

  /// Delete a trip
  Future<void> deleteTrip(String tripId) async {
    try {
      await _useCase.deleteTrip(tripId);
      _trips.removeWhere(
        (trip) =>
            trip.startLocation.timestamp.millisecondsSinceEpoch.toString() ==
            tripId,
      );
      notifyListeners();
    } catch (e) {
      _error = 'Failed to delete trip: $e';
      notifyListeners();
    }
  }

  /// Clear all trips
  Future<void> clearAllTrips() async {
    try {
      await _useCase.clearAllTrips();
      _trips.clear();
      notifyListeners();
    } catch (e) {
      _error = 'Failed to clear trips: $e';
      notifyListeners();
    }
  }

  /// Get trips within date range
  Future<List<TripModel>> getTripsInDateRange(
    DateTime start,
    DateTime end,
  ) async {
    try {
      return await _useCase.getTripsInDateRange(start, end);
    } catch (e) {
      _error = 'Failed to get trips in date range: $e';
      notifyListeners();
      return [];
    }
  }

  /// Get total distance of all trips
  Future<double> getTotalDistance() async {
    try {
      return await _useCase.getTotalDistance();
    } catch (e) {
      _error = 'Failed to get total distance: $e';
      notifyListeners();
      return 0.0;
    }
  }

  /// Clear error state
  void clearError() {
    _error = null;
    notifyListeners();
  }

  /// Refresh trips from storage
  Future<void> refreshTrips() async {
    await loadTrips();
  }
}
