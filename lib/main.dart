import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/utils/hive_setup.dart';
import 'core/network/api_client.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/providers/location_provider.dart';
import 'presentation/providers/user_provider.dart';
import 'data/datasources/location_local_datasource.dart';
import 'data/repositories/location_repository_impl.dart';
import 'data/datasources/user_remote_datasource.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/usecases/track_location_usecase.dart';
import 'domain/usecases/get_users_usecase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Add global error handler to prevent app crashes
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    print('Flutter Error: ${details.exception}');
    print('Stack trace: ${details.stack}');
  };

  // Handle platform errors
  PlatformDispatcher.instance.onError = (error, stack) {
    print('Platform Error: $error');
    print('Stack trace: $stack');
    return true;
  };

  // Initialize Hive
  await HiveSetup.init();

  // Initialize API client
  ApiClient.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Data sources
        Provider<LocationLocalDataSource>(
          create: (_) => LocationLocalDataSourceImpl(),
        ),
        Provider<UserRemoteDataSource>(
          create: (_) => UserRemoteDataSourceImpl(),
        ),
        // Repositories
        ProxyProvider<LocationLocalDataSource, LocationRepositoryImpl>(
          update: (_, dataSource, __) => LocationRepositoryImpl(dataSource),
        ),
        ProxyProvider<UserRemoteDataSource, UserRepositoryImpl>(
          update: (_, dataSource, __) => UserRepositoryImpl(dataSource),
        ),
        // Use cases
        ProxyProvider<LocationRepositoryImpl, TrackLocationUseCase>(
          update: (_, repository, __) => TrackLocationUseCase(repository),
        ),
        ProxyProvider<UserRepositoryImpl, GetUsersUseCase>(
          update: (_, repository, __) => GetUsersUseCase(repository),
        ),
        // Notifiers
        ChangeNotifierProxyProvider<TrackLocationUseCase, LocationNotifier>(
          create:
              (context) =>
                  LocationNotifier(context.read<TrackLocationUseCase>()),
          update: (_, useCase, __) => LocationNotifier(useCase),
        ),
        ChangeNotifierProxyProvider<GetUsersUseCase, UserNotifier>(
          create: (context) => UserNotifier(context.read<GetUsersUseCase>()),
          update: (_, useCase, __) => UserNotifier(useCase),
        ),
      ],
      child: MaterialApp(
        title: 'TrackMe',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
