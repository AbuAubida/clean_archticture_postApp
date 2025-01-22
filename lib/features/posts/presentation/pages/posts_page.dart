import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:posts_app/features/posts/presentation/bloc/posts/get_refresh_posts_bloc.dart';
import 'package:posts_app/features/posts/presentation/pages/posts_add_update_page.dart';
import 'package:posts_app/features/posts/presentation/widgets/get_all_posts/error_messege_widget.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../widgets/get_all_posts/posts_list_widget.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: _buildFloatingBtn(context),
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Posts "),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<GetRefreshPostsBloc, GetRefreshPostsState>(
      builder: (context, state) {
        if (state is LoadingPostsState) {
          return LoadingWidget();
        } else if (state is LoadedPostsState) {
          return RefreshIndicator(
              onRefresh: () async {
                return context
                    .read<GetRefreshPostsBloc>()
                    .add(RefreshPostsEvent());
              },
              child: PostsListWidget(posts: state.posts));
        } else if (state is LoadingPostsErrorState) {
          return ErrorMessegeWidget(messege: state.messege);
        }
        return LoadingWidget();
      },
    );
  }

  _buildFloatingBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PostsAddUpdatePage(
            isUpdate: false,
            
          );
        }));
      },
      child: Icon(Icons.add),
    );
  }
}
