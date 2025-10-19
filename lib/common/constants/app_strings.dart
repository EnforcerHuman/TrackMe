class AppStrings {
  // App Title
  static const appTitle = 'Location Tracker';
  static const appSubtitle = 'Track your journey in real-time';

  // Button Labels
  static const startButton = 'Start';
  static const stopButton = 'Stop';
  static const trackingButton = 'Tracking...';

  // Status Labels
  static const activeTracking = 'Active Tracking';
  static const inactive = 'Inactive';

  // Data Labels
  static const distance = 'Distance';
  static const records = 'Records';
  static const locationData = 'Location Data (Hive Table Structure)';

  // Units
  static const kilometers = 'km';

  // Error Messages
  static const geolocationNotSupported = 'Geolocation is not supported';
  static const permissionDenied = 'Location permission denied';
  static const positionUnavailable = 'Position unavailable';
  static const timeout = 'Location request timeout';

  // Info Messages
  static const hiveTableInfo =
      '💡 This data would be sent to your Hive table \'location_data\' via a backend API';
}
