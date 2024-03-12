import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:{{name.snakeCase()}}_domain/errors/exceptions.dart';

// For checking internet connectivity
abstract class ConnectivityService {
  Future<bool> isConnected();

  Future<ConnectivityResult> get connectivityResult;

  Stream<ConnectivityResult> get onConnectivityChanged;

  Future<void> ensureConnected();
}

class ConnectivityServiceImpl implements ConnectivityService {
  final Connectivity _connectivity;

  ConnectivityServiceImpl({required Connectivity connectivity})
      : _connectivity = connectivity;

  ///checks internet is connected or not
  ///returns [true] if internet is connected
  ///else it will return [false]
  @override
  Future<bool> isConnected() async {
    final result = await _connectivity.checkConnectivity();
    if (result != ConnectivityResult.none) {
      return true;
    }
    return false;
  }

  // to check type of internet connectivity
  @override
  Future<ConnectivityResult> get connectivityResult async {
    return _connectivity.checkConnectivity();
  }

  //check the type on internet connection on changed of internet connection
  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;

  @override
  Future<void> ensureConnected() async {
    final result = await _connectivity.checkConnectivity();
    if (result != ConnectivityResult.none) {
      return;
    }

    throw NoInternetException();
  }
}
