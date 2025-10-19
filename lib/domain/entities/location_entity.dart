class LocationEntity {
  final double latitude;
  final double longitude;
  final DateTime timestamp;
  final double? distance;

  const LocationEntity({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
    this.distance,
  });
}

class TripEntity {
  final String id;
  final LocationEntity startLocation;
  final LocationEntity endLocation;
  final double totalDistance;
  final DateTime startTime;
  final DateTime endTime;
  final List<LocationEntity> locations;

  const TripEntity({
    required this.id,
    required this.startLocation,
    required this.endLocation,
    required this.totalDistance,
    required this.startTime,
    required this.endTime,
    required this.locations,
  });
}

