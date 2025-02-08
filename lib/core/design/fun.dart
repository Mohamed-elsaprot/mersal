import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../consts.dart';
import 'appTexts.dart';
import 'app_styles.dart';


priceRow({required String title,required num price,bool main=false, bool discount=false}){
  return Row(
    children: [
      Expanded(flex: 10,child: Styles.text(title,fontWeight:main? FontWeight.w900: FontWeight.w500)),
      Expanded(flex: 10,child: Styles.text('$price ${Texts.currency}',color: discount?Colors.red:Colors.black,textAlign: TextAlign.end,fontWeight:main? FontWeight.w900: FontWeight.w500)),
      Expanded(flex: 1,child: Styles.text(discount?'-':'',color: Colors.red))
    ],
    //${discount?'-':''}
  );
}
//Styles.text('-',color: Colors.red)
loadingLottie(){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/animation/loading.json',height: 75.h),
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText('...MERSAL',textStyle: const TextStyle(color: Styles.primary,fontFamily: fontFamily,fontSize: 20))
          ],
        ),
      ],
    ),
  );
}


