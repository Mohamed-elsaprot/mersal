import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/consts.dart';
import 'package:mersal/features/business_screen/model/Restaurant.dart';

import '../../../../core/design/appTexts.dart';
import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun_widgets.dart';
import 'circle_widget.dart';

class CirclesRow extends StatelessWidget {
  const CirclesRow({super.key, required this.restaurant, required this.topPadding, required this.imagesSize});
  final Restaurant restaurant;
  final double topPadding,imagesSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Hero(
        tag: 0,
        child: CircleWidget(
            body: cachedImage(
              restaurant.logo??'',
              boxFit: BoxFit.cover,
            ), size: imagesSize,shadow: false,),
      ),
    );
  }
}
// CircleWidget(body: Column(
//   children: [
//     SizedBox(height: 4.h,),
//     Expanded(flex: 5,child: Styles.text(restaurant.orderArrivalRate.toString(),size: 20,fontWeight: FontWeight.w900),),
//     Expanded(flex: 4,child: Styles.text('دقيقة'.tr(),size: 11)),
//   ],
// ), size: 60),

// CircleWidget(body: Column(
//   children: [
//     SizedBox(height: 4.h,),
//     Expanded(flex: 5,child: Styles.text(10.toString(),size: 20,fontWeight: FontWeight.w900),),
//     Expanded(flex: 4,child: Styles.text(Texts.currency,size: 11)),
//   ],
// ), size: 60
// ),
