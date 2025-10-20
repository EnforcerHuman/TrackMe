import '../entities/location_entity.dart';

abstract class LocationRepository {
  Future<LocationEntity> getCurrentLocation();
  Future<bool> requestLocationPermission();
  Future<bool> isLocationServiceEnabled();
  Future<void> saveLocationData(LocationEntity location);
  Future<List<LocationEntity>> getAllLocationData();
  Future<void> clearLocationData();
  Future<double> calculateDistance(LocationEntity from, LocationEntity to);
}
