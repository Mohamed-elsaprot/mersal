import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/features/cart/view/cart.dart';
import 'package:mersal/features/my_orders/view/my_orders.dart';
import 'package:mersal/features/navigation_screen/manager/navigation_screen_manager.dart';
import 'package:mersal/features/navigation_screen/view/widget/cart__tab.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/design/app_styles.dart';
import 'navigation_item.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    var navCubit= BlocProvider.of<NavigationScreenCubit>(context);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CustomNavigationBar(
        scaleFactor: .00001,
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: navCubit.index,
        onTap: (x){
          if(x==1) {
            showCupertinoModalBottomSheet(context: context, builder: (context) => const MyOrders());
          }else if(x==2){
            showCupertinoModalBottomSheet(context: context, builder: (context) => const Cart());
            // showCupertinoModalBottomSheet(context: context, builder: (context) => const Cart());
          }
          else if(x==0||x==3){
            navCubit.setIndex(x);
            setState(() {});
          }
        },
        iconSize: 55.sp,
        selectedColor: Styles.primary,
        strokeColor: Colors.transparent,
        items: [
          NavigationItem.item(icon: Icons.home, title: 'الرئيسية'.tr()),
          NavigationItem.item(icon: Icons.shopping_bag, title: 'طلباتي'.tr()),
          CartTab.cartTab(context),
          NavigationItem.item(icon: CupertinoIcons.slider_horizontal_3, title: 'إعدادات'.tr()),
        ],
      ),
    );
  }
}
