import 'package:flutter/material.dart';

class CustomTextInputFiled extends StatelessWidget {
  const CustomTextInputFiled({
    super.key,
    required this.controller,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
