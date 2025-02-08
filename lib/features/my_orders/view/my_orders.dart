import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/my_orders/data/my_orders_repo.dart';
import 'package:mersal/features/my_orders/manager/my_order_cubit.dart';
import 'package:mersal/features/my_orders/view/widgets/my_orders_body.dart';

import '../manager/timer_cubit/timer_cubit.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(create: (context)=>MyOrderCubit(MyOrdersRepo())..getAvailable(),child: const MyOrdersBody(),);
  }
  //..getCorrectTime()
}
