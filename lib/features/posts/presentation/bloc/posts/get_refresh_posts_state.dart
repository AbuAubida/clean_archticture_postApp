part of 'get_refresh_posts_bloc.dart';

sealed class GetRefreshPostsState extends Equatable {
  const GetRefreshPostsState();

  @override
  List<Object> get props => [];
}

final class GetRefreshPostsInitial extends GetRefreshPostsState {}

final class LoadingPostsState extends GetRefreshPostsState {}

final class LoadedPostsState extends GetRefreshPostsState {
  final List<PostEntity> posts;

  const LoadedPostsState({required this.posts});
  @override
  List<Object> get props => [posts];
}

final class LoadingPostsErrorState extends GetRefreshPostsState {
  final String messege;

const  LoadingPostsErrorState({required this.messege});
@override
  
  List<Object> get props => [messege];

}
