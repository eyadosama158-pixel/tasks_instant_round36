import 'package:flutter/material.dart';

import '../../core/contants.dart';

class CustomWidget extends StatelessWidget {
  Widget child;
  Color? color;
  double? height;
  double? width;
  double? borderRadius;
  Alignment? alignment;
  CustomWidget({
    super.key,
    required this.child,
    this.color = const Color(0xffEF2A39),
    this.height = 55,
    this.width = 55,
    this.borderRadius = 20,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,

        borderRadius: BorderRadiusGeometry.circular(borderRadius!),
      ),
      child: child,
    );
  }
}
