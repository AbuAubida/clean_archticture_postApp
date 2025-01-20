import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkState {
  Future<bool> get isConnected;
}

class NetworkStateImplementation implements NetworkState {
  final  InternetConnectionChecker connection;

  NetworkStateImplementation(this.connection);

  @override
  
  Future<bool> get  isConnected async => await connection.hasConnection;
}
