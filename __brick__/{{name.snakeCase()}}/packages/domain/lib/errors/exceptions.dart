import 'failures.dart';

class ServerException implements Exception {
  final int code;
  final String message;

  ServerException({required this.code, required this.message});

  ServerFailure toFailure() => ServerFailure(message);
}

class CacheException implements Exception {
  final String message;

  CacheException({this.message = 'Cache error'});

  CacheFailure toFailure() => CacheFailure(message);
}

class NetworkException implements Exception {
  final String message;

  NetworkException({this.message = 'Network error'});

  Failure toFailure() => NetworkFailure(message);
}

///can be used for throwing [NoInternetException]
class NoInternetException implements Exception {
  final String message;

  NoInternetException({this.message = 'No internet connection'});
}
