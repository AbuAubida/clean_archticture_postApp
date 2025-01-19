import 'package:dartz/dartz.dart';
import 'package:posts_app/core/erorr/failures.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/domain/repositories/post_repository.dart';

class GetAllPostsUseCase {
  final PostsRepository myRepo;
  GetAllPostsUseCase(this.myRepo);
  Future<Either<Failure, List<PostEntity>>> call()async {
    return await myRepo.getAllPosts();
  }
}
