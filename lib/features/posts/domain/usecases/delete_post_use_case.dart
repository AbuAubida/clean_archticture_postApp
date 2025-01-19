import 'package:dartz/dartz.dart';
import 'package:posts_app/core/erorr/failures.dart';
import 'package:posts_app/features/posts/domain/repositories/post_repository.dart';

class DeletePostUseCase {
  final PostsRepository myRepo;
  DeletePostUseCase(this.myRepo);
  Future<Either<Failure,Unit>> call(int postId)async{
    return await myRepo.deletePost(postId);
  }
}
