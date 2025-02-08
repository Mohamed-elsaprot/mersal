import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/fun_widgets.dart';
import 'package:mersal/features/addons_sheet/manager/addons_manager/addons_cubit.dart';
import 'package:mersal/features/addons_sheet/manager/addons_manager/addons_state.dart';
import 'package:mersal/features/addons_sheet/manager/check_req_cubit/check_req_cubit.dart';
import 'package:mersal/features/addons_sheet/manager/check_req_cubit/check_req_state.dart';
import 'package:mersal/features/business_screen/manager/rest_details_cubit/rest_details_cubit.dart';
import 'package:mersal/features/business_screen/model/Product.dart';
import 'package:mersal/features/business_screen/model/RestDetailsModel.dart';
import 'package:mersal/features/cart/manager/cart_cubit.dart';

import '../../../../core/design/appTexts.dart';
import '../../../../core/design/app_styles.dart';
import '../../../../core/general_widgets/custom_button.dart';

class AddToCatButton extends StatefulWidget {
  const AddToCatButton({super.key, required this.product});
  final Product product;
  @override
  State<AddToCatButton> createState() => _AddToCatButtonState();
}

class _AddToCatButtonState extends State<AddToCatButton> {
  late AddonsCubit addonsCubit;
  late CheckReqCubit checkCubit;

  @override
  void initState() {
    addonsCubit = BlocProvider.of<AddonsCubit>(context);
    checkCubit = BlocProvider.of<CheckReqCubit>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: CustomButton(
        fun: () async {
          addonsCubit.generateAndResetReqIndexGroup(widget.product);
          addonsCubit.setReqIndexGroupMap();
          checkCubit.emit(CheckReqInitial());
          addonsCubit.check();
          if(addonsCubit.canAddToCart){
            var cartCubit = BlocProvider.of<CartCubit>(context);
            var restDetailsCubit = BlocProvider.of<RestDetailsCubit>(context);

            if(cartCubit.setRestId(id: restDetailsCubit.restDetailsModel!.restaurant!.uuid!)){
              await cartCubit.addToCart(addonsCubit.setCartProduct(widget.product)).then((x){
                Navigator.pop(context);
              });
            }else{
              customDialog(context: context, message: 'المطعم مختلف، هل تريد استبدال وجبات السلة بوجبات هذا المطعم؟'.tr(),
                  secTitle: 'نعم'.tr(),fun: () async {
                    cartCubit.resetOrder();
                    cartCubit.setRestId(id: restDetailsCubit.restDetailsModel!.restaurant!.uuid!);
                    await cartCubit.addToCart(addonsCubit.setCartProduct(widget.product)).then((x){
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
                  });
            }
          }
        },
        title: '',rad: 8,
        padding: EdgeInsets.symmetric(horizontal: 25.w,),
        titleWidget: BlocBuilder<AddonsCubit,AddonsState>(builder: (context,state){
          return Row(
            children: [
              Styles.text('اضافة الي الطلب'.tr(),color: Colors.white),
              const Spacer(),
              Styles.text('${(addonsCubit.selectedSize.price! + addonsCubit.addonsSum)*addonsCubit.count} ${Texts.currency}',color: Colors.white),
            ],
          );
        }),
      ),
    );
  }
}
