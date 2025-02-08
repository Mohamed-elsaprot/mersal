import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/features/my_orders/model/MyOrderProducts.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun_widgets.dart';

class OrderMealItem extends StatefulWidget {
  const OrderMealItem({super.key, required this.product});
  final MyOrderProducts product;

  @override
  State<OrderMealItem> createState() => _OrderMealItemState();
}

class _OrderMealItemState extends State<OrderMealItem> {
  num addonsSum = 0;
  @override
  void initState() {
    for (var x in widget.product.extras!) {
      addonsSum+= ((x.price??0) * (x.quantity??0));
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: cachedImage(widget.product.image??'', width: 100.w, height: 85.w, boxFit: BoxFit.cover,),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Styles.text('${widget.product.name??'--- '} ${widget.product.sizeName??''} ${(widget.product.price??0)+addonsSum}',),
              const SizedBox(height: 5),
              ...List.generate(widget.product.comprehensiveExtras!.length, (index)=>Row(
                children: [
                  Styles.subTitle('بدون'.tr(),size: 12),
                  const SizedBox(width: 4,),
                  Styles.subTitle(widget.product.comprehensiveExtras![index],size: 12),
                ],
              )),
              //${product.extras![index].price} × ${product.extras![index].quantity}
              ...List.generate(widget.product.extras!.length, (index)=>Styles.subTitle('+ ${widget.product.extras![index].extraName??''}',size: 12)),
              const SizedBox(height: 2),
              Styles.text('₪${(widget.product.quantity??1)*((widget.product.price??0)+addonsSum)}',color: Styles.primary),
            ],
          ),
        ),
        CircleAvatar(
          radius: 14,backgroundColor: Colors.grey.shade200,
          child: FittedBox(fit: BoxFit.scaleDown,child: Styles.text('${widget.product.quantity??0}',size: 12)),
        )
      ],
    );
  }
}
