import 'package:trackme/data/models/TripMoodel.dart';
import '../../data/repositories/trip_history_repository_impl.dart';

class TripHistoryUseCase {
  final TripHistoryRepositoryImpl _repository;

  TripHistoryUseCase(this._repository);

  /// Save a completed trip to history
  Future<void> saveTrip(TripModel trip) async {
    await _repository.saveTrip(trip);
  }

  /// Get all saved trips (sorted by newest first)
  Future<List<TripModel>> getAllTrips() async {
    return await _repository.getAllTrips();
  }

  /// Delete a specific trip by ID
  Future<void> deleteTrip(String tripId) async {
    await _repository.deleteTrip(tripId);
  }

  /// Clear all trip history
  Future<void> clearAllTrips() async {
    await _repository.clearAllTrips();
  }

  /// Get a specific trip by ID
  Future<TripModel?> getTripById(String tripId) async {
    return await _repository.getTripById(tripId);
  }

  /// Get trips within a date range
  Future<List<TripModel>> getTripsInDateRange(
    DateTime start,
    DateTime end,
  ) async {
    final allTrips = await _repository.getAllTrips();
    return allTrips.where((trip) {
      final tripDate = trip.startLocation.timestamp;
      return tripDate.isAfter(start.subtract(const Duration(days: 1))) &&
          tripDate.isBefore(end.add(const Duration(days: 1)));
    }).toList();
  }

  /// Get total distance of all trips
  Future<double> getTotalDistance() async {
    final trips = await _repository.getAllTrips();
    return trips.fold<double>(0.0, (sum, trip) => sum + trip.totalDistance);
  }

  /// Get trip count
  Future<int> getTripCount() async {
    final trips = await _repository.getAllTrips();
    return trips.length;
  }
}
