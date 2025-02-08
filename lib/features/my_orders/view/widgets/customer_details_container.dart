import 'package:flutter/material.dart';
import 'package:mersal/features/my_orders/model/MyOrder.dart';

import '../../../../core/design/app_styles.dart';

class CustomerDetailsContainer extends StatelessWidget {
  const CustomerDetailsContainer({super.key, required this.order});
  final MyOrder order;
  customRow(t1,String t2, {double? size = 16}){
    return Row(
      children: [
        Expanded(child: Styles.text(t1.toString(),size: size)),
        Expanded(child: Styles.text(t2.toString(),size: size,textAlign: TextAlign.end)),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customRow(order.customer!.name??' ', '#${order.orderNumber??000}'),
        customRow(order.customer!.phone??'', order.createdAt??'---',size: 12),
      ],
    );
  }
}
