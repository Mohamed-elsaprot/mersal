import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../features/cart/manager/cart_cubit.dart';
import '../../features/cart/manager/cart_state.dart';
import '../../features/cart/view/cart.dart';
import '../design/appTexts.dart';
import '../design/app_styles.dart';
import 'custom_button.dart';

class GoCartButton extends StatelessWidget {
  const GoCartButton({super.key, required this.isHome});
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);

    return BlocBuilder<CartCubit,CartState>(
      builder: (context,state)=>cartCubit.cartTotal!=0?Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
        child: CustomButton(
          fun: () {
            if(!isHome) Navigator.pop(context);
            // showCupertinoModalBottomSheet(context: context, builder: (context) => const Cart());
            Future.delayed(Duration(milliseconds: isHome?0:150),()=>showCupertinoModalBottomSheet(context: context, builder: (context) => const Cart()));
          }, title: '', rad: 6,
          titleWidget: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart,color: Colors.white,size: 20,),
                const SizedBox(width: 6,),
                Styles.text('الطلبية'.tr(), color: Colors.white),
                const Spacer(),
                Styles.text('${cartCubit.cartTotal} ${Texts.currency}', color: Colors.white),
              ],
            ),
          ),
        ),
      ):const SizedBox(),
    );
  }
}
