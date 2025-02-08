import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/fun_widgets.dart';
import 'package:mersal/features/my_orders/manager/my_order_cubit.dart';
import 'package:mersal/features/my_orders/manager/my_order_state.dart';
import 'package:mersal/features/my_orders/view/widgets/my_order_card.dart';
import 'package:mersal/features/my_orders/view/widgets/orders_app_bar.dart';
import 'package:mersal/features/my_orders/view/widgets/orders_type_button.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun.dart';
import '../../../../core/router.dart';

class MyOrdersBody extends StatefulWidget {
  const MyOrdersBody({super.key});

  @override
  State<MyOrdersBody> createState() => _MyOrdersBodyState();
}

class _MyOrdersBodyState extends State<MyOrdersBody> {
  late final ScrollController scrollController;
  late MyOrderCubit ordersCubit;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    ordersCubit = BlocProvider.of<MyOrderCubit>(context);
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.offset){
        if(ordersCubit.page==1){
          ordersCubit.getClosedNext();
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: Styles.primary,
        onRefresh: ()async{
          var ordersCubit = BlocProvider.of<MyOrderCubit>(context);
          ordersCubit.page==0? ordersCubit.getAvailable():ordersCubit.getClosed();
        },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(0, 180.h),
          child: const OrdersAppBar(),
        ),
        body: BlocConsumer<MyOrderCubit,MyOrderState>(
          listener: (context,state){
            if(state is MyOrderFailure) customDialog(context: context, message: state.errorMessage);
            // if(state is TimeSuccess) ordersCubit.getAvailable();
          },
          builder: (context,state){
            if(state is MyOrderSuccess){
              return ListView.separated(
                controller: ordersCubit.page==0?null:scrollController,
                padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 20.h),
                itemCount: ordersCubit.page==0? ordersCubit.available.length : ordersCubit.closed.length,
                separatorBuilder: (context,index)=>const SizedBox(height: 20,),
                itemBuilder: (context,index)=>
                    MyOrderCard(
                        order: ordersCubit.page==0? ordersCubit.available[index]:ordersCubit.closed[index],
                        last: (ordersCubit.page==1 && index==ordersCubit.closed.length-1 && ordersCubit.closed.length>1)? ordersCubit.last:null,
                    ),
              );
            }else{
              return ListView.separated(
                controller: scrollController,
                padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 20.h),
                itemCount: 10,
                separatorBuilder: (context,index)=>const SizedBox(height: 20,),
                itemBuilder: (context,index)=>
                    shimmerWidget(height: 520.h, width: double.infinity,rad: 6),
              );
            }
          },
        ),
      ),
    );
  }
}


