import 'package:flutter/material.dart';

import '../../../../../core/app_theme.dart';

class AddUpdatePostButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isUpdate;
  const AddUpdatePostButton({super.key, this.onPressed,required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(primaryColor),
          foregroundColor: WidgetStateProperty.all(secondaryColor),
          shadowColor: WidgetStateProperty.all(secondaryColor),
        ),
        icon: Icon(
          isUpdate ? Icons.edit : Icons.add,
          color: secondaryColor,
        ),
        onPressed: onPressed,
        label: Text(isUpdate ? "Edit" : "Add"));
  }
}
