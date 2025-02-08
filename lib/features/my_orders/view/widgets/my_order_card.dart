import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/features/my_orders/manager/timer_cubit/timer_cubit.dart';
import 'package:mersal/features/my_orders/model/MyOrder.dart';

import '../../../../core/design/fun.dart';
import 'customer_details_container.dart';
import 'message_note.dart';
import 'order_meal_item.dart';
import 'order_state_row.dart';
import 'order_state_widget.dart';

class MyOrderCard extends StatelessWidget {
  const MyOrderCard({super.key, required this.order, this.last});
  final MyOrder order; final bool? last;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12,blurRadius: 10,offset: const Offset(2, 2)),
              // BoxShadow(color: Colors.grey.shade300,offset: const Offset(-2, 1)),
            ],
            borderRadius: BorderRadius.circular(6),
          ),
          padding: EdgeInsets.all(25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomerDetailsContainer(order: order,),
              SizedBox(height: 15.h,),
              if(order.note!=null)MessageNote(note: order.note!,),
              SizedBox(height: 15.h,),
              if(order.status!<=4)BlocProvider(create: (context)=>TimerCubit(),child: OrderStateWidget(stateId: order.status!.toInt(),timer: order.timer,),),
              order.status!<=4?const OrderStateTitlesRow():
              CircleAvatar(
                  backgroundColor: order.status==5?Styles.primary:Colors.redAccent,
                  child: Styles.text(order.status==5?'تم':'ملغي',color: Colors.white,size: 14).tr()),
              SizedBox(height: 35.h,),
              ...List.generate(order.myOrderProducts!.length, (index)=>Column(
                children: [
                  OrderMealItem(product: order.myOrderProducts![index],),
                  if(index!=4)const Divider(height: 30,)
                ],
              )),
              SizedBox(height: 20.h,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey.shade100
                ),
                padding: const EdgeInsets.all(15),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    children: [
                      priceRow(title: 'اجمالي الطلبية'.tr(), price: order.totalProducts??0),
                      priceRow(title: 'تكلفة التوصيل'.tr(), price: order.deliveryCost??0),
                      if(order.coupon!=0)priceRow(title: 'خصم من كوبون'.tr(), price: order.coupon??0,discount: true),
                      Divider(color: Colors.black,height: 25.h,),
                      priceRow(title: 'الاجمالي للدفع'.tr(), price: order.totalProducts!+order.deliveryCost!-(order.coupon??0),main: true),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if(last!=null)
          if(!last!)
            SizedBox(height: 20.h,),
        if(last!=null)
          if(!last!)const CircularProgressIndicator(color: Styles.primary,)
      ],
    );
  }
}
