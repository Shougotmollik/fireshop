import 'package:flutter/material.dart';

class InsertImageWidget extends StatelessWidget {
  const InsertImageWidget({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black38, width: 2),
          ),
          child: Center(
            child: Icon(
              Icons.linked_camera_outlined,
              color: Colors.black45,
              size: 38,
            ),
          ),
        ),
      ),
    );
  }
}
