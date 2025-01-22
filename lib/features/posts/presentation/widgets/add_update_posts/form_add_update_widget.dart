import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/app_theme.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/presentation/bloc/add_ubdate_delete_post_bloc/add_ubdate_delete_post_bloc.dart';
import 'package:posts_app/features/posts/presentation/widgets/add_update_posts/add_update_post_button.dart';
import 'package:posts_app/features/posts/presentation/widgets/add_update_posts/custom_text_filed.dart';

class FormAddUpdateWidget extends StatefulWidget {
  final bool isUpdate;
  final PostEntity? post;
  const FormAddUpdateWidget({super.key, required this.isUpdate, this.post});

  @override
  State<FormAddUpdateWidget> createState() => _FormAddUpdateWidgetState();
}

class _FormAddUpdateWidgetState extends State<FormAddUpdateWidget> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  @override
  void initState() {
    if (widget.isUpdate) {
      titleController.text = widget.post!.title;
      bodyController.text = widget.post!.body;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFiled(
                hintText: "Title", controller: titleController, radius: 10),
            // SizedBox(height: 20),
            CustomTextFiled(
                hintText: "Body", controller: bodyController, maxLines: 7),
            SizedBox(height: 20),
            AddUpdatePostButton(
                isUpdate: widget.isUpdate, onPressed: _addUpdatePuttonPressed),
          ],
        ),
      ),
    );
  }

  void _addUpdatePuttonPressed() {
    if (formKey.currentState!.validate()) {
      if (widget.isUpdate) {
        context
            .read<AddUbdateDeletePostBloc>()
            .add(UpdatePostEvent(post: widget.post!));
      } else {
        context.read<AddUbdateDeletePostBloc>().add(AddPostEvent(
            post: PostEntity(
                id: 0,
                title: titleController.text,
                body: bodyController.text)));
      }
    }
  }
}
