import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/cart/manager/cart_cubit.dart';
import 'package:mersal/features/check_out/data/check_out_repo.dart';
import 'package:mersal/features/check_out/manager/check_out_cubit.dart';
import 'package:mersal/features/check_out/manager/coupon_cubit/coupon_cubit.dart';
import 'package:mersal/features/check_out/manager/delivery_cubit/delivery_cost_cubit.dart';
import 'package:mersal/features/check_out/view/widgets/check_out_body.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => CheckOutCubit(CheckOutRepo())..setOrderData(cartCubit.orderModel),),
      BlocProvider(create: (context) => DeliveryCostCubit(CheckOutRepo()),),
      BlocProvider(create: (context) => CouponCubit(CheckOutRepo()),),
    ], child: const CheckOutBody());
      //const CheckOutBody();
  }
}
