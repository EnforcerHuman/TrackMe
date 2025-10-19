class AppConstants {
  // API
  static const String baseUrl = 'https://gorest.co.in/public/v2';
  static const String usersEndpoint = '/users';

  // Hive
  static const String locationDataBox = 'location_data';
  static const String tripDataBox = 'trip_data';

  // Location
  static const double defaultAccuracy = 10.0; // meters
  static const Duration locationUpdateInterval = Duration(seconds: 5);
  static const Duration locationTimeout = Duration(seconds: 10);

  // UI
  static const double buttonHeight = 60.0;
  static const double buttonWidth = 200.0;
  static const double borderRadius = 12.0;
}

