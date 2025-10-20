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
  final LocationEntity startLocation;
  final LocationEntity endLocation;
  final double totalDistance;

  TripEntity({
    required this.startLocation,
    required this.endLocation,
    required this.totalDistance,
  });
}
