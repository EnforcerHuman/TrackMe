class LocationDataModel {
  final int id;
  final String timestamp;
  final double latitude;
  final double longitude;
  final double accuracy;

  LocationDataModel({
    required this.id,
    required this.timestamp,
    required this.latitude,
    required this.longitude,
    required this.accuracy,
  });
}
