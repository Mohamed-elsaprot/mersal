import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/consts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../general_widgets/custom_button.dart';
import '../router.dart';
import 'app_styles.dart';

Widget cachedImage(String img,{double? rad,BoxFit boxFit=BoxFit.fill,bool smallImage=false,bool slider = false,double? height=220,double? width=double.infinity}){
  return ClipRRect(
    borderRadius: BorderRadius.circular(rad??0),
    child: SizedBox(
      height: height,
      width: width,
      child: CachedNetworkImage(
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.black12,
          highlightColor: Colors.white12,
          child: Container(
            color: Colors.white,
            height: width,width: width,
          ),
        ),
        errorWidget: (context, url, error) {
          return FittedBox(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline),
              SizedBox(height: 8.h,),
              FittedBox(child: Styles.text('No Image Found',textAlign: TextAlign.center)),
            ],
            ),
          );
        },
        imageUrl: imgUrl+img,
        // imageUrl: img,
        fit: boxFit,
      ),
    ),
  );
}

Widget shimmerWidget({required double height,required double width,double? rad=0,EdgeInsetsGeometry? margin,BorderRadiusGeometry? borderRad,Color color=Colors.white}){
  return Shimmer.fromColors(
    baseColor: const Color(0xffeeeeee),
    highlightColor: const Color(0xffffffff),
    child: Container(
      height: height,width: width,
      decoration: BoxDecoration(
        borderRadius:borderRad?? BorderRadius.circular(rad!.r),
        color: color,
      ),
      margin: margin,
    ),
  );
}

customDialog({required BuildContext context,required String message,void Function()? fun,String? secTitle})async{
  showDialog(context: context, builder: (context){
    return AlertDialog(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Styles.text(message,textAlign: TextAlign.center),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(fun!=null)CustomButton(
                padding: EdgeInsets.symmetric(horizontal: 45.w,vertical: 10.h),
                fun: fun,
                title: secTitle??'',
                rad: 50,textSize: 12,
              ),
              if(fun!=null)const SizedBox(width: 5,),
              CustomButton(
                padding: EdgeInsets.symmetric(horizontal: 45.w,vertical: 10.h),
                fun: () => Navigator.pop(context),
                title: 'اغلاق'.tr(),
                rad: 50,textSize: 12,
              ),
            ],
          )
        ],
      ),
    );
  });
}


PreferredSize sheetApBar({required String title}){
  return PreferredSize(
    preferredSize: Size(0, 80.h),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        children: [
          Styles.text(title, size: 18),
          const Spacer(),
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 18,
            child: IconButton(
              icon: const Icon(Icons.close, size: 20,),
              onPressed: () {
                AppRouter.router.pop();
              },
            ),
          )
        ],
      ),
    ),
  );
}

