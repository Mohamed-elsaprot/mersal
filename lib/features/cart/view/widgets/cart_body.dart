import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/appTexts.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/core/design/fun_widgets.dart';
import 'package:mersal/core/general_widgets/custom_button.dart';
import 'package:mersal/core/local_storage/secure_storage.dart';
import 'package:mersal/features/auth/view/phone/phone_auth_screen.dart';
import 'package:mersal/features/cart/manager/cart_cubit.dart';
import 'package:mersal/features/cart/manager/cart_state.dart';
import 'package:mersal/features/check_out/view/check_out.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/router.dart';
import 'cart_item.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      backgroundColor: Styles.scaffoldWhiteColor,
      appBar: sheetApBar(title: 'طلبيتي'.tr()),
      body: BlocBuilder<CartCubit,CartState>(
        buildWhen: (context,state)=> state is CartChange,
        builder: (context,state)=>ListView.builder(
            padding: EdgeInsets.only(bottom: 100.h),
            itemCount: cartCubit.orderModel.products!.length, itemBuilder: (context, index) =>
            CartItem(cartProduct: cartCubit.orderModel.products![index],productIndex: index,)
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
        child: CustomButton(
          fun: () {
            if(SecureStorage.token!=null){
              if(cartCubit.orderModel.products!.isNotEmpty){
                AppRouter.router.pop();
                Future.delayed(const Duration(milliseconds: 200),(){
                  showCupertinoModalBottomSheet(
                    expand: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const CheckOut(),
                  );
                });
              }else{
                AppRouter.router.pop();
              }
            }else{
              AppRouter.router.pop();
              Future.delayed(const Duration(milliseconds: 200),(){
                showCupertinoModalBottomSheet(
                  expand: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const AuthScreen(),
                );
              });
            }

          }, title: '', rad: 6,
          titleWidget: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            child: BlocBuilder<CartCubit,CartState>(
                buildWhen: (context,state)=> state is CartChange,
                builder: (context,state)=>Row(
                  children: [
                    Styles.text('الانتقال للدفع'.tr(), color: Colors.white),
                    const Spacer(),
                    Styles.text('${cartCubit.cartTotal} ${Texts.currency}', color: Colors.white),
                  ],
            )),
          ),
        ),
      ),
    );
  }
}
