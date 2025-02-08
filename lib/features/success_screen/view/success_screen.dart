import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/core/design/images.dart';
import 'package:mersal/core/general_widgets/sec_button.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../my_orders/view/my_orders.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie.asset('assets/animation/check.json',
            //   animate: true,repeat: true,
            //   frameRate: FrameRate.max,
            //   filterQuality: FilterQuality.high,
            //   options: LottieOptions(enableMergePaths: true),
            //   fit: BoxFit.contain,
            // ),
            Image.asset(Images.sucPic,width: 160.w,),
            SizedBox(height: 30.h,),
            FittedBox(child: Styles.text('طُلب بنجاح!'.tr(),size: 50,color: Colors.white)),
            const SizedBox(height: 20,),
            Styles.text('ويتم الان تحضير طلبك بكُل حب'.tr(),color: Colors.white,textAlign: TextAlign.center,),
            const SizedBox(height: 40,),
            SecButton(title: 'تابع الطلبية'.tr(),successScreen: true, fun: (){
              Navigator.pop(context);
              Future.delayed(const Duration(milliseconds: 250),()=>showCupertinoModalBottomSheet(context: context, builder: (context) => const MyOrders()));
            }),
            const SizedBox(height: 25,),
            SecButton(title: 'الرئيسية'.tr(),successScreen: true, fun: (){
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}
