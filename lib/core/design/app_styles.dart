import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../consts.dart';

abstract class Styles{
  static const Color primary = Color(0xff40b0ff);
  static const Color primaryButtons = Color(0xffEDF7FC);
  static const Color primaryShad = Color(0xffd3f0fd);
  static Color scaffoldColor = const Color(0xfff3f3f3);
  static Color scaffoldWhiteColor = Colors.white;
  static Color secScaffoldColor = Colors.white.withOpacity(.95);
  static Text text(String t, {TextDecoration? decoration,int? maxLine,double? size=16,Color? color=Colors.black,FontWeight fontWeight=FontWeight.w600,TextOverflow? overflow,TextAlign? textAlign=TextAlign.start,double? letterSpacing}){
    return Text(t,maxLines: maxLine,
      style: TextStyle(fontSize: size!.sp,fontWeight: fontWeight,color: color,fontFamily: fontFamily,letterSpacing: letterSpacing,decoration: decoration),
      overflow: overflow,textAlign: textAlign,);
  }

  static Text subTitle(String t,{TextDecoration? decoration,double? size=9,Color color=Colors.black38,FontWeight fontWeight=FontWeight.w600,TextOverflow? overflow,TextAlign? textAlign=TextAlign.start}){
    return Text(t,style: TextStyle(fontSize: size!.sp,fontWeight: fontWeight,color: color,fontFamily: fontFamily,decoration: decoration),overflow: overflow,textAlign: textAlign,);
  }
}