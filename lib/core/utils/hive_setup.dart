import 'package:hive_flutter/hive_flutter.dart';
import '../constants/app_constants.dart';
import '../../data/models/location_data_model.dart';

class HiveSetup {
  static Future<void> init() async {
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(LocationDataModelAdapter());
    Hive.registerAdapter(TripDataModelAdapter());

    // Open boxes
    await Hive.openBox<LocationDataModel>(AppConstants.locationDataBox);
    await Hive.openBox<TripDataModel>(AppConstants.tripDataBox);
  }
}

