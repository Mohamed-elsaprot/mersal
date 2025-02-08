import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../design/appTexts.dart';
import '../design/app_styles.dart';

class RemovedPrice extends StatelessWidget {
  const RemovedPrice({super.key, required this.removedPrice, this.textSize=14});
  final num removedPrice;
  final double? textSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      child: Stack(
        children: [
          SizedBox(
            width: 60.w,  height: 30,
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Styles.subTitle('$removedPrice ${Texts.currency}',color: Colors.black26,size: textSize)
            ),
          ),
          Positioned(
            bottom: 13.5,
            child: Container(
              color: Colors.black26,height: 2,width: 60,
            ),
          )
        ],
      ),
    );
  }
}
