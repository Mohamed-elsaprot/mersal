import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/my_orders/manager/my_order_cubit.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/general_widgets/method_widget.dart';

class OrdersTypeButton extends StatefulWidget {
  const OrdersTypeButton({super.key});

  @override
  State<OrdersTypeButton> createState() => _OrdersTypeButtonState();
}

class _OrdersTypeButtonState extends State<OrdersTypeButton> {

  late MyOrderCubit myOrdersCubit;

  @override
  void initState() {
    myOrdersCubit = BlocProvider.of<MyOrderCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Styles.primaryButtons,
          borderRadius: BorderRadius.circular(100)
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MethodWidget(title: 'الجارية'.tr(), chosen: myOrdersCubit.page==0, fun: () async {
            if(myOrdersCubit.page!=0){
              myOrdersCubit.page=0;
              setState(() {});
              await myOrdersCubit.getAvailable();
            }
          }),
          MethodWidget(title: 'السابقة'.tr(), chosen: myOrdersCubit.page==1, fun: () async {
            if(myOrdersCubit.page!=1){
              myOrdersCubit.page=1;
              setState(() {});
              await myOrdersCubit.getClosed();
            }
          }),
        ],
      ),
    );
  }
}
