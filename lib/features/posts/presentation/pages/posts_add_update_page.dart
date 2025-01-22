import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/utils/getting_data_messege.dart';
import 'package:posts_app/core/widgets/loading_widget.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/presentation/bloc/add_ubdate_delete_post_bloc/add_ubdate_delete_post_bloc.dart';
import 'package:posts_app/features/posts/presentation/pages/posts_page.dart';

import '../widgets/add_update_posts/form_add_update_widget.dart';

class PostsAddUpdatePage extends StatelessWidget {
  final bool isUpdate;
  final PostEntity? post;

  const PostsAddUpdatePage({super.key, required this.isUpdate, this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(isUpdate ? "Edit Post" : "Add  Post"),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<AddUbdateDeletePostBloc, AddUbdateDeletePostState>(
      listener: (context, state) {
        if (state is SuccessfullAddUbdateDeletePostState) {
          gettingDataMessege(
              condition: DataCondition.success,
              messege: state.messege,
              context: context);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) {
            return PostsPage();
          }), (route) => false);
        } else if (state is ErrorAddUbdateDeletePostState) {
          gettingDataMessege(
              condition: DataCondition.fail,
              messege: state.messege,
              context: context);
        }
      },
      builder: (context, state) {
        if (state is LoadingAddUbdateDeletePostState) {
          return LoadingWidget();
        } else {
          return FormAddUpdateWidget(
            isUpdate: isUpdate,
            post: post,
          );
        }
      },
    );
  }
}

enum DataCondition {
  success,
  fail,
}
