// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TripMoodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TripModelAdapter extends TypeAdapter<TripModel> {
  @override
  final int typeId = 1;

  @override
  TripModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TripModel(
      startLocation: fields[0] as LocationDataModel,
      endLocation: fields[1] as LocationDataModel,
      totalDistance: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, TripModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.startLocation)
      ..writeByte(1)
      ..write(obj.endLocation)
      ..writeByte(2)
      ..write(obj.totalDistance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TripModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripModelImpl _$$TripModelImplFromJson(Map<String, dynamic> json) =>
    _$TripModelImpl(
      startLocation: LocationDataModel.fromJson(
          json['startLocation'] as Map<String, dynamic>),
      endLocation: LocationDataModel.fromJson(
          json['endLocation'] as Map<String, dynamic>),
      totalDistance: (json['totalDistance'] as num).toDouble(),
    );

Map<String, dynamic> _$$TripModelImplToJson(_$TripModelImpl instance) =>
    <String, dynamic>{
      'startLocation': instance.startLocation,
      'endLocation': instance.endLocation,
      'totalDistance': instance.totalDistance,
    };
