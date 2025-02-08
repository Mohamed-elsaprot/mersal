import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';

class OrderStateTitlesRow extends StatelessWidget {
  const OrderStateTitlesRow({super.key});

  @override
  Widget build(BuildContext context) {
    // Map stateName = {  0: "جديد", 1: "تحضير", 2: "جاهز", 3: "جاري التوصيل", 4: "وصل التوصيل", 5: "تم", 6: "ملغي"};

    return Row(
      children: [
        titleWidget('جديد'.tr(), AlignmentDirectional.centerStart),
        titleWidget('تحضير'.tr(), AlignmentDirectional.center),
        titleWidget('جاهز'.tr(), AlignmentDirectional.center),
        titleWidget('جاري التوصيل'.tr(), AlignmentDirectional.center),
        titleWidget('وصل التوصيل'.tr(), AlignmentDirectional.centerEnd),
      ],
    );
  }

  titleWidget(String title,AlignmentGeometry align){
    return Expanded(
        child: Align(
          alignment: align,
          child: SizedBox(
            height: 60.h,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(radius: 6, backgroundColor: Styles.primaryButtons,),
                ),
                Styles.text(title, size: 10,textAlign: TextAlign.center),
              ],
            ),
          ),
        ));
  }
}
