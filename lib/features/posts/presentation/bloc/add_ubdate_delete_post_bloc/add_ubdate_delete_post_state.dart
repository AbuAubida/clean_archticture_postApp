part of 'add_ubdate_delete_post_bloc.dart';

sealed class AddUbdateDeletePostState extends Equatable {
  const AddUbdateDeletePostState();

  @override
  List<Object> get props => [];
}

final class AddUbdateDeletePostInitial extends AddUbdateDeletePostState {}

final class LoadingAddUbdateDeletePostState
    extends AddUbdateDeletePostState {}

final class SuccessfullAddUbdateDeletePostState
    extends AddUbdateDeletePostState {
  final String messege;

  const SuccessfullAddUbdateDeletePostState({required this.messege});
@override
  
  List<Object> get props => [messege];
}
final class ErrorAddUbdateDeletePostState
    extends AddUbdateDeletePostState {
  final String messege;

  const ErrorAddUbdateDeletePostState({required this.messege});
  @override
  List<Object> get props => [messege];
}
