import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({super.key, required this.borderColor, required this.color, required this.body,
    this.padding=const EdgeInsets.symmetric(horizontal: 12,vertical: 1.5),});
  final Color borderColor,color;
  final Widget body;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: borderColor),
          color: color,
        ),
        child: body,
      );
  }
}
