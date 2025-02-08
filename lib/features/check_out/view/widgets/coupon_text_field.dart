import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/general_widgets/custom_button.dart';
import 'package:mersal/features/cart/manager/cart_cubit.dart';
import 'package:mersal/features/check_out/manager/coupon_cubit/coupon_state.dart';

import '../../../../core/design/app_styles.dart';
import '../../manager/coupon_cubit/coupon_cubit.dart';

class CouponTextField extends StatelessWidget {
  const CouponTextField({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    var couponCubit = BlocProvider.of<CouponCubit>(context);
    var cartCubit = BlocProvider.of<CartCubit>(context);
    TextEditingController controller = TextEditingController();
    String? co;
    return TextFormField(
      cursorColor: Styles.primary,
      onTap: (){
        Future.delayed(const Duration(milliseconds: 150),(){
           scrollController.jumpTo(scrollController.position.maxScrollExtent);
        });
      },
      controller: controller,
      onChanged: (x) {
        co=x;
        cartCubit.orderModel.coupon=null;
      },
      decoration: InputDecoration(
         contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        label: Styles.text('كوبون'.tr(),),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.black)),
        suffixIcon: SizedBox(
            width: 100,height: 55.h,
            child: BlocConsumer<CouponCubit,CouponState>(
                listener: (context,state){
                  if(state is CouponSuccess) cartCubit.orderModel.coupon = co;
                },
                builder: (context,state){
              if(state is CouponLoading) {
                return CustomButton(
                fun: (){}, title: ''.tr(),rad: 40,backGroundColor: Colors.black,
                titleWidget: const SizedBox(height: 20,width: 20,child: CircularProgressIndicator(color: Colors.white,)),
              );
              }
              return CustomButton(
                fun: () async {
                  if(state is CouponSuccess) {
                    cartCubit.orderModel.coupon=null;
                    controller.text='';
                    couponCubit.couponDiscount=0;
                    couponCubit.emit(CouponInitial());
                  }else{
                    await couponCubit.getDiscount(resId: cartCubit.orderModel.restId!, coupon: co??'');
                  }
                }, title: state is CouponSuccess? 'الغاء'.tr():'تحقق'.tr(),rad: 40,backGroundColor:state is CouponSuccess? Colors.green: Colors.black,
              );
            }
            )
        )
      ),
    );
  }
}
