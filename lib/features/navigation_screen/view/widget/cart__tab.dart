import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/features/cart/manager/cart_cubit.dart';
import 'package:mersal/features/cart/manager/cart_state.dart';

import '../../../../core/design/app_styles.dart';

abstract class CartTab {
  static CustomNavigationBarItem cartTab(BuildContext context){
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return CustomNavigationBarItem(
      icon: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CartCubit,CartState>(builder: (context,state) {
              return cartCubit.orderModel!=null? badges.Badge(
                  badgeContent: Text(
                    cartCubit.orderModel!.products!.isNotEmpty?
                    cartCubit.orderModel!.products!.length.toString():' ',
                    style: const TextStyle(color: Colors.white,fontSize: 14),
                  ),
                  position: badges.BadgePosition.custom(end: 14, bottom: 7,),
                  badgeStyle: badges.BadgeStyle(
                    padding: EdgeInsets.all(4.4.sp),
                    badgeColor: cartCubit.orderModel!.products!.isNotEmpty?Styles.primary:Colors.transparent,
                  ),
                  child: const Icon(Icons.shopping_cart,size: 22,color: Colors.black,)
              ):const Icon(Icons.shopping_cart,size: 22,color: Colors.black,);
            }),
            const SizedBox(height: 3,),
            FittedBox(child: Styles.text('السلة'.tr(),size: 10,)),
          ],
        ),
      ),
    );
  }
}
