import '../entities/location_entity.dart';
import '../../data/repositories/location_repository_impl.dart';

class TrackLocationUseCase {
  final LocationRepositoryImpl _repository;

  TrackLocationUseCase(this._repository);

  Future<LocationEntity> getCurrentLocation() async {
    return await _repository.getCurrentLocation();
  }

  Future<bool> requestLocationPermission() async {
    return await _repository.requestLocationPermission();
  }

  Future<bool> isLocationServiceEnabled() async {
    return await _repository.isLocationServiceEnabled();
  }

  Future<void> saveLocationData(LocationEntity location) async {
    await _repository.saveLocationData(location);
  }

  Future<List<LocationEntity>> getAllLocationData() async {
    return await _repository.getAllLocationData();
  }

  Future<void> clearLocationData() async {
    await _repository.clearLocationData();
  }

  Future<double> calculateDistance(
    LocationEntity from,
    LocationEntity to,
  ) async {
    return await _repository.calculateDistance(from, to);
  }
}
