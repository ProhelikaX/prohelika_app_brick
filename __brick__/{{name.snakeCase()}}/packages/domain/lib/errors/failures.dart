import 'exceptions.dart';

sealed class Failure {
  final String message;

  Failure(this.message);

  factory Failure.fromException(Object e) {
    if (e is ServerException) {
      return e.toFailure();
    }
    if (e is CacheException) {
      return e.toFailure();
    }
    if (e is NetworkException) {
      return e.toFailure();
    }

    if (e is NoInternetException) {
      return NoInternetFailure();
    }

    return UnknownFailure(e.toString());
  }
}

// General failures
final class ServerFailure extends Failure {
  ServerFailure([String? message]) : super(message ?? 'Server Failure');
}

final class CacheFailure extends Failure {
  CacheFailure([String? message]) : super(message ?? 'Cache Failure');
}

final class NetworkFailure extends Failure {
  NetworkFailure([String? message]) : super(message ?? 'Network Failure');
}

final class NoInternetFailure extends Failure {
  NoInternetFailure([String? message])
      : super(message ?? 'No Internet Failure');
}

final class UnknownFailure extends Failure {
  UnknownFailure([String? message]) : super(message ?? 'Unknown Failure');
}
