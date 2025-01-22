import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';

class PostsListWidget extends StatelessWidget {
  final List<PostEntity> posts;
  const PostsListWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(posts[index].id.toString()),
            title: Text(
              posts[index].title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index].body),
            onTap: () {},
            contentPadding: EdgeInsets.all(10),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(thickness: 1,);
        },
        itemCount: posts.length);
  }
}
