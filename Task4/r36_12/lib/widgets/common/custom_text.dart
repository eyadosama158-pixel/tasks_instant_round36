import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight? fontWeight;
  final double fontSize;

  const CustomText({
    super.key,
    required this.title,
    required this.color,
    this.fontWeight,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
