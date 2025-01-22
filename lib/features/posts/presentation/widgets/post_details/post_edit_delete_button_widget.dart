import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/getting_data_messege.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../bloc/add_ubdate_delete_post_bloc/add_ubdate_delete_post_bloc.dart';
import '../../pages/posts_add_update_page.dart';
import '../../pages/posts_page.dart';

class PostEditDeleteButtonWidget extends StatelessWidget {
  final bool isDelete;
  final int postId;
  final void Function()? onPressed;
  const PostEditDeleteButtonWidget(
      {super.key, required this.isDelete, this.onPressed, required this.postId});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed:
          isDelete ? () => _showDeleteDialoug(context, postId) : onPressed,
      label: Text(isDelete ? "Delete" : "Edit"),
      icon: Icon(
        isDelete ? Icons.delete : Icons.edit,
        color: Colors.white,
      ),
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
              isDelete ? Colors.redAccent : Colors.blueGrey),
          foregroundColor: WidgetStateProperty.all(Colors.white)),
    );
  }

  void _showDeleteDialoug(BuildContext context, int postId) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return BlocConsumer<AddUbdateDeletePostBloc,
              AddUbdateDeletePostState>(
            listener: (context, state) {
              if (state is SuccessfullAddUbdateDeletePostState) {
                gettingDataMessege(
                    condition: DataCondition.success,
                    messege: state.messege,
                    context: context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => PostsPage()),
                    (_) => false);
              } else if (state is ErrorAddUbdateDeletePostState) {
                gettingDataMessege(
                    condition: DataCondition.fail,
                    messege: state.messege,
                    context: context);
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              if (state is LoadingAddUbdateDeletePostState) {
                return LoadingWidget();
              }
              return AlertDialog(
                contentTextStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.redAccent),
                content: Text("Are you Sure of Delete?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "NO",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  TextButton(
                      onPressed: () {
                        context
                            .read<AddUbdateDeletePostBloc>()
                            .add(DeletePostEvent(postId: postId));
                      },
                      child: Text("YES",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              );
            },
          );
        });
  }
}
