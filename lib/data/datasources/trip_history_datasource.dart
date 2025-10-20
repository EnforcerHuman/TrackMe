import 'package:hive/hive.dart';
import 'package:trackme/data/models/TripMoodel.dart';
import '../../core/constants/app_constants.dart';

/// Interface for trip history storage operations
abstract class TripHistoryDataSource {
  Future<void> saveTrip(TripModel trip);
  Future<List<TripModel>> getAllTrips();
  Future<void> deleteTrip(String tripId);
  Future<void> clearAllTrips();
  Future<TripModel?> getTripById(String tripId);
}

/// Hive-based trip history storage implementation
class TripHistoryDataSourceImpl implements TripHistoryDataSource {
  // Cache box to avoid repeated opening
  Box<TripModel>? _tripBox;

  Future<Box<TripModel>> get _tripBoxInstance async {
    _tripBox ??= await Hive.openBox<TripModel>(AppConstants.tripHistoryBox);
    return _tripBox!;
  }

  @override
  Future<void> saveTrip(TripModel trip) async {
    final box = await _tripBoxInstance;
    // Use timestamp as key for unique identification
    final key = trip.startLocation.timestamp.millisecondsSinceEpoch.toString();
    await box.put(key, trip);
  }

  @override
  Future<List<TripModel>> getAllTrips() async {
    final box = await _tripBoxInstance;
    final trips = box.values.toList();
    // Sort by start time (newest first)
    trips.sort(
      (a, b) => b.startLocation.timestamp.compareTo(a.startLocation.timestamp),
    );
    return trips;
  }

  @override
  Future<void> deleteTrip(String tripId) async {
    final box = await _tripBoxInstance;
    await box.delete(tripId);
  }

  @override
  Future<void> clearAllTrips() async {
    final box = await _tripBoxInstance;
    await box.clear();
  }

  @override
  Future<TripModel?> getTripById(String tripId) async {
    final box = await _tripBoxInstance;
    return box.get(tripId);
  }
}
