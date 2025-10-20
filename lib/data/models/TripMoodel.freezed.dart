// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TripMoodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TripModel _$TripModelFromJson(Map<String, dynamic> json) {
  return _TripModel.fromJson(json);
}

/// @nodoc
mixin _$TripModel {
  @HiveField(0)
  LocationDataModel get startLocation => throw _privateConstructorUsedError;
  @HiveField(1)
  LocationDataModel get endLocation => throw _privateConstructorUsedError;
  @HiveField(2)
  double get totalDistance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripModelCopyWith<TripModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripModelCopyWith<$Res> {
  factory $TripModelCopyWith(TripModel value, $Res Function(TripModel) then) =
      _$TripModelCopyWithImpl<$Res, TripModel>;
  @useResult
  $Res call(
      {@HiveField(0) LocationDataModel startLocation,
      @HiveField(1) LocationDataModel endLocation,
      @HiveField(2) double totalDistance});

  $LocationDataModelCopyWith<$Res> get startLocation;
  $LocationDataModelCopyWith<$Res> get endLocation;
}

/// @nodoc
class _$TripModelCopyWithImpl<$Res, $Val extends TripModel>
    implements $TripModelCopyWith<$Res> {
  _$TripModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startLocation = null,
    Object? endLocation = null,
    Object? totalDistance = null,
  }) {
    return _then(_value.copyWith(
      startLocation: null == startLocation
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as LocationDataModel,
      endLocation: null == endLocation
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as LocationDataModel,
      totalDistance: null == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationDataModelCopyWith<$Res> get startLocation {
    return $LocationDataModelCopyWith<$Res>(_value.startLocation, (value) {
      return _then(_value.copyWith(startLocation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationDataModelCopyWith<$Res> get endLocation {
    return $LocationDataModelCopyWith<$Res>(_value.endLocation, (value) {
      return _then(_value.copyWith(endLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TripModelImplCopyWith<$Res>
    implements $TripModelCopyWith<$Res> {
  factory _$$TripModelImplCopyWith(
          _$TripModelImpl value, $Res Function(_$TripModelImpl) then) =
      __$$TripModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) LocationDataModel startLocation,
      @HiveField(1) LocationDataModel endLocation,
      @HiveField(2) double totalDistance});

  @override
  $LocationDataModelCopyWith<$Res> get startLocation;
  @override
  $LocationDataModelCopyWith<$Res> get endLocation;
}

/// @nodoc
class __$$TripModelImplCopyWithImpl<$Res>
    extends _$TripModelCopyWithImpl<$Res, _$TripModelImpl>
    implements _$$TripModelImplCopyWith<$Res> {
  __$$TripModelImplCopyWithImpl(
      _$TripModelImpl _value, $Res Function(_$TripModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startLocation = null,
    Object? endLocation = null,
    Object? totalDistance = null,
  }) {
    return _then(_$TripModelImpl(
      startLocation: null == startLocation
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as LocationDataModel,
      endLocation: null == endLocation
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as LocationDataModel,
      totalDistance: null == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TripModelImpl implements _TripModel {
  const _$TripModelImpl(
      {@HiveField(0) required this.startLocation,
      @HiveField(1) required this.endLocation,
      @HiveField(2) required this.totalDistance});

  factory _$TripModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripModelImplFromJson(json);

  @override
  @HiveField(0)
  final LocationDataModel startLocation;
  @override
  @HiveField(1)
  final LocationDataModel endLocation;
  @override
  @HiveField(2)
  final double totalDistance;

  @override
  String toString() {
    return 'TripModel(startLocation: $startLocation, endLocation: $endLocation, totalDistance: $totalDistance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripModelImpl &&
            (identical(other.startLocation, startLocation) ||
                other.startLocation == startLocation) &&
            (identical(other.endLocation, endLocation) ||
                other.endLocation == endLocation) &&
            (identical(other.totalDistance, totalDistance) ||
                other.totalDistance == totalDistance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, startLocation, endLocation, totalDistance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripModelImplCopyWith<_$TripModelImpl> get copyWith =>
      __$$TripModelImplCopyWithImpl<_$TripModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripModelImplToJson(
      this,
    );
  }
}

abstract class _TripModel implements TripModel {
  const factory _TripModel(
      {@HiveField(0) required final LocationDataModel startLocation,
      @HiveField(1) required final LocationDataModel endLocation,
      @HiveField(2) required final double totalDistance}) = _$TripModelImpl;

  factory _TripModel.fromJson(Map<String, dynamic> json) =
      _$TripModelImpl.fromJson;

  @override
  @HiveField(0)
  LocationDataModel get startLocation;
  @override
  @HiveField(1)
  LocationDataModel get endLocation;
  @override
  @HiveField(2)
  double get totalDistance;
  @override
  @JsonKey(ignore: true)
  _$$TripModelImplCopyWith<_$TripModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
