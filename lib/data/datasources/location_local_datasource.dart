import 'package:hive/hive.dart';
import '../../core/constants/app_constants.dart';
import '../models/location_data_model.dart';

/// Interface for local data storage operations
abstract class LocationLocalDataSource {
  Future<void> saveLocationData(LocationDataModel location);
  Future<List<LocationDataModel>> getAllLocationData();
  Future<void> clearLocationData();
}

/// Hive-based local data storage implementation
class LocationLocalDataSourceImpl implements LocationLocalDataSource {
  // Cache box to avoid repeated opening
  Box<LocationDataModel>? _locationBox;

  Future<Box<LocationDataModel>> get _locationBoxInstance async {
    _locationBox ??= await Hive.openBox<LocationDataModel>(
      AppConstants.locationDataBox,
    );
    return _locationBox!;
  }

  @override
  Future<void> saveLocationData(LocationDataModel location) async {
    final box = await _locationBoxInstance;
    await box.add(location); // Append for chronological order
  }

  @override
  Future<List<LocationDataModel>> getAllLocationData() async {
    final box = await _locationBoxInstance;
    return box.values.toList();
  }

  @override
  Future<void> clearLocationData() async {
    final box = await _locationBoxInstance;
    await box.clear();
  }
}
