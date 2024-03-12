import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:{{name.snakeCase()}}_domain/repositories/person_repository.dart';
import 'package:{{name.snakeCase()}}_infrastructure/data/sources/remote/person_remote_source.dart';

import 'repositories/person_repository.dart';
import 'services/connectivity_service.dart';

final _getIt = GetIt.instance;

T getIt<T extends Object>() {
  return _getIt<T>();
}

abstract class InfrastructureDependency {
  static void tearDown() {
    _getIt.reset();
  }

  static Future<void> setUp(Map<String, String> env) async {
    // Dio
    _getIt.registerSingleton<Dio>(
      Dio(
        BaseOptions(
          baseUrl: env['BASE_URL']!,
          connectTimeout: const Duration(seconds: 60),
        ),
      ),
    );

    // Connectivity
    _getIt.registerSingleton<Connectivity>(Connectivity());
    _getIt.registerSingleton<ConnectivityService>(
      ConnectivityServiceImpl(connectivity: getIt()),
    );

    // Person
    _getIt.registerSingleton<PersonRemoteSource>(
      PersonRemoteSourceImpl(dio: getIt()),
    );
    _getIt.registerSingleton<PersonRepository>(
      PersonRepositoryImpl(personRemoteSource: getIt()),
    );
  }
}
