import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{

}
class NoInternetConnectionFailure extends Failure{
  @override
  
  List<Object?> get props => [];

}
class ServerDataFailure extends Failure{
  @override
  
  List<Object?> get props => [];

}
class CasheDataFailure extends Failure {
  @override
  List<Object?> get props => [];
}
