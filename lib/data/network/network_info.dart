// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplementation implements NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;
  NetworkInfoImplementation(
    this._internetConnectionChecker,
  );
  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}
