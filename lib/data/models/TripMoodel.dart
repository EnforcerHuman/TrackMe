import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'package:trackme/data/models/location_data_model.dart';

part 'TripMoodel.freezed.dart';
part 'TripMoodel.g.dart';

@freezed
@HiveType(typeId: 1)
class TripModel with _$TripModel {
  const factory TripModel({
    @HiveField(0) required LocationDataModel startLocation,
    @HiveField(1) required LocationDataModel endLocation,
    @HiveField(2) required double totalDistance,
  }) = _TripModel;

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);
}
