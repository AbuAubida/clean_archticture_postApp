import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';

import '../widgets/post_details/post_details_widget.dart';

class PostsDetailsPage extends StatelessWidget {
  final PostEntity post;
  const PostsDetailsPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Post Details"),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: PostDetailsWidget(post: post),
    );
  }
}
