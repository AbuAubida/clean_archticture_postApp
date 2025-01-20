part of 'get_refresh_posts_bloc.dart';

sealed class GetRefreshPostsEvent extends Equatable {
  const GetRefreshPostsEvent();

  @override
  List<Object> get props => [];
}
class GetAllPostsEvent extends GetRefreshPostsEvent{}
class RefreshPostsEvent extends GetRefreshPostsEvent {}
