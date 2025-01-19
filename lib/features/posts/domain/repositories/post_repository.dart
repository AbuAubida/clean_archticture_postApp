import 'package:posts_app/features/posts/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getAllPosts();
  Future<bool> deletePost(int postId);
  Future<bool> ubdatePost(PostEntity post);
 Future<bool> addPost(PostEntity post);
}
