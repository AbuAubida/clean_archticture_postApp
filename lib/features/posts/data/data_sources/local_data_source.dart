import 'package:dartz/dartz.dart';
import 'package:posts_app/features/posts/data/models/post_model.dart';

abstract class LocalDataSource {
  Future<List<PostModel>> getCashedPosts();
  Future<Unit> cashePosts(List<PostModel>posts);
}
class LocalDataSourceImplementation implements LocalDataSource{
  @override
  Future<Unit> cashePosts(List<PostModel> posts) {
    // TODO: implement cashePosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getCashedPosts() {
    // TODO: implement getCashedPosts
    throw UnimplementedError();
  }
}
