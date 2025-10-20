// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationDataModel _$LocationDataModelFromJson(Map<String, dynamic> json) {
  return _LocationDataModel.fromJson(json);
}

/// @nodoc
mixin _$LocationDataModel {
  @HiveField(0)
  double get latitude => throw _privateConstructorUsedError;
  @HiveField(1)
  double get longitude => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get timestamp => throw _privateConstructorUsedError;
  @HiveField(3)
  double? get distance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationDataModelCopyWith<LocationDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDataModelCopyWith<$Res> {
  factory $LocationDataModelCopyWith(
          LocationDataModel value, $Res Function(LocationDataModel) then) =
      _$LocationDataModelCopyWithImpl<$Res, LocationDataModel>;
  @useResult
  $Res call(
      {@HiveField(0) double latitude,
      @HiveField(1) double longitude,
      @HiveField(2) DateTime timestamp,
      @HiveField(3) double? distance});
}

/// @nodoc
class _$LocationDataModelCopyWithImpl<$Res, $Val extends LocationDataModel>
    implements $LocationDataModelCopyWith<$Res> {
  _$LocationDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationDataModelImplCopyWith<$Res>
    implements $LocationDataModelCopyWith<$Res> {
  factory _$$LocationDataModelImplCopyWith(_$LocationDataModelImpl value,
          $Res Function(_$LocationDataModelImpl) then) =
      __$$LocationDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) double latitude,
      @HiveField(1) double longitude,
      @HiveField(2) DateTime timestamp,
      @HiveField(3) double? distance});
}

/// @nodoc
class __$$LocationDataModelImplCopyWithImpl<$Res>
    extends _$LocationDataModelCopyWithImpl<$Res, _$LocationDataModelImpl>
    implements _$$LocationDataModelImplCopyWith<$Res> {
  __$$LocationDataModelImplCopyWithImpl(_$LocationDataModelImpl _value,
      $Res Function(_$LocationDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
    Object? distance = freezed,
  }) {
    return _then(_$LocationDataModelImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationDataModelImpl implements _LocationDataModel {
  const _$LocationDataModelImpl(
      {@HiveField(0) required this.latitude,
      @HiveField(1) required this.longitude,
      @HiveField(2) required this.timestamp,
      @HiveField(3) this.distance});

  factory _$LocationDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationDataModelImplFromJson(json);

  @override
  @HiveField(0)
  final double latitude;
  @override
  @HiveField(1)
  final double longitude;
  @override
  @HiveField(2)
  final DateTime timestamp;
  @override
  @HiveField(3)
  final double? distance;

  @override
  String toString() {
    return 'LocationDataModel(latitude: $latitude, longitude: $longitude, timestamp: $timestamp, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDataModelImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, latitude, longitude, timestamp, distance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationDataModelImplCopyWith<_$LocationDataModelImpl> get copyWith =>
      __$$LocationDataModelImplCopyWithImpl<_$LocationDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationDataModelImplToJson(
      this,
    );
  }
}

abstract class _LocationDataModel implements LocationDataModel {
  const factory _LocationDataModel(
      {@HiveField(0) required final double latitude,
      @HiveField(1) required final double longitude,
      @HiveField(2) required final DateTime timestamp,
      @HiveField(3) final double? distance}) = _$LocationDataModelImpl;

  factory _LocationDataModel.fromJson(Map<String, dynamic> json) =
      _$LocationDataModelImpl.fromJson;

  @override
  @HiveField(0)
  double get latitude;
  @override
  @HiveField(1)
  double get longitude;
  @override
  @HiveField(2)
  DateTime get timestamp;
  @override
  @HiveField(3)
  double? get distance;
  @override
  @JsonKey(ignore: true)
  _$$LocationDataModelImplCopyWith<_$LocationDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
