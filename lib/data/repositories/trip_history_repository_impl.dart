import 'package:trackme/data/models/TripMoodel.dart';
import '../datasources/trip_history_datasource.dart';

/// Repository interface for trip history operations
abstract class TripHistoryRepository {
  Future<void> saveTrip(TripModel trip);
  Future<List<TripModel>> getAllTrips();
  Future<void> deleteTrip(String tripId);
  Future<void> clearAllTrips();
  Future<TripModel?> getTripById(String tripId);
}

/// Implementation of trip history repository
class TripHistoryRepositoryImpl implements TripHistoryRepository {
  final TripHistoryDataSource _dataSource;

  TripHistoryRepositoryImpl(this._dataSource);

  @override
  Future<void> saveTrip(TripModel trip) async {
    await _dataSource.saveTrip(trip);
  }

  @override
  Future<List<TripModel>> getAllTrips() async {
    return await _dataSource.getAllTrips();
  }

  @override
  Future<void> deleteTrip(String tripId) async {
    await _dataSource.deleteTrip(tripId);
  }

  @override
  Future<void> clearAllTrips() async {
    await _dataSource.clearAllTrips();
  }

  @override
  Future<TripModel?> getTripById(String tripId) async {
    return await _dataSource.getTripById(tripId);
  }
}
