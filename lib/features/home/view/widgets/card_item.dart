import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/consts.dart';
import 'package:mersal/core/router.dart';
import 'package:mersal/features/auth/view/phone/phone_auth_screen.dart';
import 'package:mersal/features/home/models/HomeRestaurant.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun_widgets.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.homeRestaurant});
  final HomeRestaurant homeRestaurant;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppRouter.router.push(AppRouter.business,extra: homeRestaurant.uuid!);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16,left: 20,right: 20,bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              child: SizedBox(
                height: 145.h,
                child: Stack(
                  children: [
                    cachedImage(
                      homeRestaurant.banners!.isNotEmpty?homeRestaurant.banners![0].image??'':burgerImage, // Replace with your image URL
                      boxFit: BoxFit.cover,
                      height: 145.h,
                      width: double.infinity,
                    ),
                    if(0==1? true:false)Container(
                      color: Colors.black38,
                      alignment: Alignment.center,
                      child: Styles.text('مُغلق'.tr(),color: Colors.white,fontWeight: FontWeight.w900,size: 20),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 14.w,top: 4.h,bottom: 8.h,end: 8.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Styles.text(homeRestaurant.name??'', fontWeight: FontWeight.bold,size: 14),
                      const SizedBox(height: 1.5,),
                      Styles.text(homeRestaurant.description??'', color: Colors.grey[600],size: 10),
                      const SizedBox(height: 3,),
                      Row(
                        children: [
                          const Icon(Icons.delivery_dining, size: 14, color: Colors.black),
                          const SizedBox(width: 5),
                          // Styles.text('35 ${Texts.currency}',size: 11,fontWeight: FontWeight.bold),
                          // const SizedBox(width: 6),
                          Styles.text('- ${homeRestaurant.orderArrivalRate} ${'دقيقة'.tr()}',size: 9, color: Colors.grey[600]),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 10),
                    child: Hero(
                      tag: homeRestaurant.uuid!,
                      child: cachedImage(
                        homeRestaurant.logo??''
                            // logo
                                ??'', // Replace with your logo URL
                        height: 45, width: 45, rad: 100,
                        boxFit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
