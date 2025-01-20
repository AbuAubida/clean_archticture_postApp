import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/core/errors/failures.dart';
import 'package:posts_app/core/strings/failures.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/usecases/get_all_posts_use_case.dart';

part 'get_refresh_posts_event.dart';
part 'get_refresh_posts_state.dart';

class GetRefreshPostsBloc
    extends Bloc<GetRefreshPostsEvent, GetRefreshPostsState> {
  final GetAllPostsUseCase getAllPostsUseCase;
  GetRefreshPostsBloc({required this.getAllPostsUseCase})
      : super(GetRefreshPostsInitial()) {
    on<GetRefreshPostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
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

  String getFailureMessege(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure():
        return SERVER_FAILURE_MESSAGE;
      case NoInternetConnectionFailure():
        return OFFLINE_FAILURE_MESSAGE;
      case CasheDataFailure():
        return EMPTY_CACHE_FAILURE_MESSAGE;

      default:
        return "Unexpected error please try again ! .";
    }
  }
}
