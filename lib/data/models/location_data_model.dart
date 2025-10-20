import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'location_data_model.freezed.dart';
part 'location_data_model.g.dart';

@freezed
@HiveType(typeId: 0)
class LocationDataModel with _$LocationDataModel {
  const factory LocationDataModel({
    @HiveField(0) required double latitude,
    @HiveField(1) required double longitude,
    @HiveField(2) required DateTime timestamp,
    @HiveField(3) double? distance,
  }) = _LocationDataModel;

  factory LocationDataModel.fromJson(Map<String, dynamic> json) =>
      _$LocationDataModelFromJson(json);
}
