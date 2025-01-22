import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/presentation/pages/posts_add_update_page.dart';

import 'package:posts_app/features/posts/presentation/widgets/post_details/post_edit_delete_button_widget.dart';

import '../../../../../core/widgets/custom_divider.dart';

class PostDetailsWidget extends StatelessWidget {
  final PostEntity post;
  const PostDetailsWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // title text
          Text(
            post.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          CustomDivider(),
          Text(
            post.body,
            style: TextStyle(fontSize: 16),
          ),
          CustomDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PostEditDeleteButtonWidget(
                postId: post.id,
                isDelete: false,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => PostsAddUpdatePage(
                                isUpdate: true,
                                post: post,
                              )));
                },
              ),
              PostEditDeleteButtonWidget(
                postId: post.id,
                isDelete: true,
                
              ),
            ],
          ),
        ],
      ),
    );
  }
}
