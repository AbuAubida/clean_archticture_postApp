import 'package:posts_app/core/constants/api/api_keys.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel(
      {required super.id, required super.title, required super.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json[ApiKeys.id],
        title: json[ApiKeys.title],
        body: json[ApiKeys.body]);
  }
  Map<String, dynamic> toJson() {
    return {ApiKeys.id: id, ApiKeys.title: title, ApiKeys.body: body};
  }
}
