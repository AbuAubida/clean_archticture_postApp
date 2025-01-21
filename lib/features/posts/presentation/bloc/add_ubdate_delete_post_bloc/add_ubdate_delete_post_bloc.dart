import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/core/strings/success_operations_messege.dart';
import 'package:posts_app/core/utils/failure_messege_function.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/usecases/add_post_use_case.dart';
import 'package:posts_app/features/posts/domain/usecases/delete_post_use_case.dart';
import 'package:posts_app/features/posts/domain/usecases/ubdate_post_use_case.dart';

part 'add_ubdate_delete_post_event.dart';
part 'add_ubdate_delete_post_state.dart';

class AddUbdateDeletePostBloc
    extends Bloc<AddUbdateDeletePostEvent, AddUbdateDeletePostState> {
  final AddPostUseCase addPostUseCase;
  final UbdatePostUseCase updatePostUseCase;
  final DeletePostUseCase deletePostUseCase;

  AddUbdateDeletePostBloc(
      {required this.addPostUseCase,
      required this.updatePostUseCase,
      required this.deletePostUseCase})
      : super(AddUbdateDeletePostInitial()) {
    on<AddUbdateDeletePostEvent>((event, emit) async {
      if (event is AddPostEvent) {
        emit(LoadingAddUbdateDeletePostState());
        final failureOrSucess = await addPostUseCase(event.post);
        addUbdateDeletePost(failureOrSucess, ADD_SUCCESS_MESSAGE);
      } else if (event is UpdatePostEvent) {
        emit(LoadingAddUbdateDeletePostState());
        final failureOrSucess = await updatePostUseCase(event.post);
addUbdateDeletePost(failureOrSucess, UPDATE_SUCCESS_MESSAGE);
      } else if (event is DeletePostEvent) {
        emit(LoadingAddUbdateDeletePostState());
        final failureOrSucess = await deletePostUseCase(event.postId);
        addUbdateDeletePost(failureOrSucess, DELETE_SUCCESS_MESSAGE);
      }
    });
  }
  AddUbdateDeletePostState addUbdateDeletePost(
      Either failureOrSucess, String messege) {
    return failureOrSucess.fold(
      (failure) {
        return ErrorAddUbdateDeletePostState(
            messege: getFailureMessege(failure));
      },
      (success) {
        return SuccessfullAddUbdateDeletePostState(messege: messege);
      },
    );
  }
}
