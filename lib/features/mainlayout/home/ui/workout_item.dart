import 'package:flutter/material.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem({super.key, required this.imagePath, required this.ontap});
  final String imagePath;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Image.asset(imagePath),
    );
  }
}
