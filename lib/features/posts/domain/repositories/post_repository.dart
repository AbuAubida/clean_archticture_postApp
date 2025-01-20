import 'package:dartz/dartz.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';

import '../../../../core/errors/failures.dart';

abstract interface class PostsRepository {
  
 Future<Either<Failure, List<PostEntity>>>  getAllPosts();
  Future<Either<Failure,Unit>> deletePost(int postId);
  Future<Either<Failure,Unit>> ubdatePost(PostEntity post);
 Future<Either<Failure,Unit>> addPost(PostEntity post);
}
