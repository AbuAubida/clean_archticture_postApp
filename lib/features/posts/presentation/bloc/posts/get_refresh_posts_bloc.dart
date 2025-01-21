import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/core/errors/failures.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/usecases/get_all_posts_use_case.dart';

import '../../../../../core/utils/failure_messege_function.dart';

part 'get_refresh_posts_event.dart';
part 'get_refresh_posts_state.dart';

class GetRefreshPostsBloc
    extends Bloc<GetRefreshPostsEvent, GetRefreshPostsState> {
  final GetAllPostsUseCase getAllPostsUseCase;
  GetRefreshPostsBloc({required this.getAllPostsUseCase})
      : super(GetRefreshPostsInitial()) {
    on<GetRefreshPostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent ||event is RefreshPostsEvent) {
        emit(LoadingPostsState());
        final postsOrFailure = await getAllPostsUseCase();
        emit(getRefreshPosts(postsOrFailure));
      }
    });
  }
  GetRefreshPostsState getRefreshPosts(
      Either<Failure, List<PostEntity>> postsOrFailure) {
    return postsOrFailure.fold((failure) {
      return LoadingPostsErrorState(messege: getFailureMessege(failure));
    }, (posts) {
      return LoadedPostsState(posts: posts);
    });
  }
}
