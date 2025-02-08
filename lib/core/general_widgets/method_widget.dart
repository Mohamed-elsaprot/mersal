import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../design/app_styles.dart';

class MethodWidget extends StatelessWidget {
  const MethodWidget({super.key,required this.title,required this.chosen,required this.fun});

  final String title;
  final bool chosen;
  final void Function() fun;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: fun,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: chosen? Colors.black:Colors.transparent,
            borderRadius: BorderRadius.circular(100),
          ),
          width: 120.w,height: 44.h,
          child: Styles.text(title,color: chosen?Colors.white:Colors.black),
        ),
      );
    ;
  }
}
