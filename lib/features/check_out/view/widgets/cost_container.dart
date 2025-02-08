import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/fun_widgets.dart';
import 'package:mersal/features/cart/manager/cart_cubit.dart';
import 'package:mersal/features/check_out/manager/coupon_cubit/coupon_cubit.dart';
import 'package:mersal/features/check_out/manager/coupon_cubit/coupon_state.dart';
import 'package:mersal/features/check_out/manager/delivery_cubit/delivery_cost_cubit.dart';
import 'package:mersal/features/check_out/manager/delivery_cubit/delivery_cost_state.dart';

import '../../../../core/design/appTexts.dart';
import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun.dart';
import '../../manager/check_out_cubit.dart';
import '../../manager/check_out_state.dart';

class CostContainer extends StatefulWidget {
  const CostContainer({super.key});

  @override
  State<CostContainer> createState() => _CostContainerState();
}

class _CostContainerState extends State<CostContainer> {

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var deliveryCubit = BlocProvider.of<DeliveryCostCubit>(context);
    var couponCubit = BlocProvider.of<CouponCubit>(context);
    var checkOutCubit = BlocProvider.of<CheckOutCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          priceRow(title: 'اجمالي الطلبية'.tr(), price: cartCubit.cartTotal),
          BlocConsumer<DeliveryCostCubit,DeliveryCostState>(
              listener: (context,state){
                setState(() {});
                checkOutCubit.emit(CheckOutInitial());
                if(state is DeliveryCostFailure) customDialog(context: context, message: state.errorMessage);
              },
              builder: (context,state){
                return priceRow(title: 'تكلفة التوصيل'.tr(), price: couponCubit.minCart>=cartCubit.cartTotal? 0 : deliveryCubit.deliveryCost);
          }),
          BlocConsumer<CouponCubit,CouponState>(
              listener: (context,state){
                setState(() {});
                checkOutCubit.emit(CheckOutInitial());
                if(state is CouponFailure) customDialog(context: context, message: state.errorMessage);
              },
              builder: (context,state){
                return couponCubit.couponDiscount!=0?priceRow(title: 'خصم من كوبون'.tr(), price: couponCubit.couponDiscount,discount: true):SizedBox();
          }),
          Divider(color: Colors.black,height: 25.h,),
          priceRow(title: 'الاجمالي للدفع'.tr(), price: cartCubit.cartTotal+deliveryCubit.deliveryCost-couponCubit.couponDiscount,main: true),
        ],
      ),
    );
  }
}
