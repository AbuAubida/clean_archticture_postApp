import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final TextEditingController controller;
  final double? radius;
  const CustomTextFiled(
      {super.key,
      required this.hintText,
      this.maxLines,
      required this.controller,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: TextFormField(
        validator: (value) => value!.isEmpty ? "$hintText cant be null" : null,
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          border: _buildBorder(color: Colors.grey),
          errorBorder: _buildBorder(color: Colors.redAccent),
          focusedErrorBorder: _buildBorder(color: Colors.lightBlueAccent),
          focusedBorder: _buildBorder(color: Colors.green),
          enabledBorder: _buildBorder(color: Colors.grey),
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 20),
      borderSide: BorderSide(color: Colors.grey, width: 1),
    );
  }
}
