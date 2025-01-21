part of 'add_ubdate_delete_post_bloc.dart';

sealed class AddUbdateDeletePostEvent extends Equatable {
  const AddUbdateDeletePostEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends AddUbdateDeletePostEvent {
  final PostEntity post;

const  AddPostEvent({required this.post});
@override
 
  List<Object> get props => [post];
}

class DeletePostEvent extends AddUbdateDeletePostEvent {
  final int postId;

  const DeletePostEvent({required this.postId});
  @override
  List<Object> get props => [postId];
}
class UpdatePostEvent extends AddUbdateDeletePostEvent {
  final PostEntity post;

  const UpdatePostEvent({required this.post});
  @override
  List<Object> get props => [post];
}
