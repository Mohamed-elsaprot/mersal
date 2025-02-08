import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/local_storage/model/cart_product.dart';
import 'package:mersal/features/cart/manager/cart_cubit.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun_widgets.dart';
import '../../../../core/design/images.dart';
import '../../../addons_sheet/view/widgets/counter_icon.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.cartProduct, required this.productIndex});
  final CartProduct cartProduct;
  final int productIndex;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late CartCubit cartCubit;
  // num height = 10;
  @override
  void initState() {
    cartCubit = BlocProvider.of<CartCubit>(context);
    num x = widget.cartProduct.extras!.length+widget.cartProduct.comprehensiveExtras!.length;
    // if(x<3) height = 40;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: cachedImage(widget.cartProduct.image??'', width: 100.w, height: 100.w, boxFit: BoxFit.cover,),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Styles.text(widget.cartProduct.name??'',fontWeight: FontWeight.w900),
                if(widget.cartProduct.comprehensiveExtras!.isNotEmpty || widget.cartProduct.extras!.isNotEmpty)
                  const SizedBox(height: 5),
                ...List.generate(widget.cartProduct.comprehensiveExtras!.length, (index)=>
                    Styles.text('${'بدون'.tr()} ${widget.cartProduct.comprehensiveExtras![index].name??''}',size: 12,)
                ),
                ...List.generate(widget.cartProduct.extras!.length, (index)=>
                    Styles.text('+ ${
                        widget.cartProduct.extras![index].quantity!>1?' ${widget.cartProduct.extras![index].quantity}  ':''
                    }${widget.cartProduct.extras![index].name}',size: 12,)
                ),
                // SizedBox(height:height.h),
                Styles.text('₪${
                    (widget.cartProduct.selectedSize!.price!+widget.cartProduct.addonsSum!)*widget.cartProduct.quantity!
                    }',color: Styles.primary),
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
            child: Row(
              children: [
                CounterIcon(image: Images.add, fun: (){
                  cartCubit.updateProduct(pro: widget.cartProduct, index: widget.productIndex, add: true);
                  setState(() {});
                }),
                Padding(padding: const EdgeInsets.all(10), child: Styles.text('${widget.cartProduct.quantity}'),),
                CounterIcon(image: Images.min, fun: (){
                  cartCubit.updateProduct(pro: widget.cartProduct, index: widget.productIndex, add: false);
                  setState(() {});
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
