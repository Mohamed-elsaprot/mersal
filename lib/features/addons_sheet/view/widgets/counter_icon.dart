import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/app_styles.dart';

import '../../../../core/design/images.dart';

class CounterIcon extends StatelessWidget {
  const CounterIcon({super.key, required this.image, required this.fun});
  final String image;
  final void Function() fun;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        color: Colors.transparent,
        width: 35.w,
        alignment: Alignment.center,
        child: Image.asset(image,width: 20,),
      ),
    );
  }
}
