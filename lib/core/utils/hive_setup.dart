import 'package:hive_flutter/hive_flutter.dart';
import 'package:trackme/data/models/TripMoodel.dart';
import '../constants/app_constants.dart';
import '../../data/models/location_data_model.dart';

class HiveSetup {
  static late Box<LocationDataModel> box;

  static Future<Box<LocationDataModel>> init() async {
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(LocationDataModelAdapter());
    Hive.registerAdapter(TripModelAdapter());

    // Open boxes
    await Hive.openBox<LocationDataModel>(AppConstants.locationDataBox);
    await Hive.openBox<TripModel>(AppConstants.tripHistoryBox);

    box = Hive.box<LocationDataModel>(AppConstants.locationDataBox);

    // print(
    //   'Opened Hive box "${AppConstants.locationDataBox}" with ${box.length} entries.',
    // );

    // if (box.isEmpty) {
    //   print('Box is empty.');
    // } else {
    //   for (var key in box.keys) {
    //     final item = box.get(key);
    //     print('Key: $key, Value: $item');
    //   }
    // }

    return box;
  }
}
