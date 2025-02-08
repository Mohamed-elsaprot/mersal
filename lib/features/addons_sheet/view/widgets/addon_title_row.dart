import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';

class AddonTitleRow extends StatelessWidget {
  const AddonTitleRow({super.key, required this.t1, this.required=false,});
  final String t1;
  final bool? required;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xfffafafa),
              Color(0xfff3f3f3),
            ]
          ),
          borderRadius: BorderRadius.circular(3)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
      child: SizedBox(
        width: double.infinity,
        height: 25.h,
        child: Row(
          children: [
            Styles.text(t1,size: 15),
            const Spacer(),
            Styles.text(required!?'اجباري'.tr():'',size: 12,fontWeight: FontWeight.w600),
          ],
        ),
      ),
    );
  }
}
