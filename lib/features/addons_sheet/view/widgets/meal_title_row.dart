import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/features/addons_sheet/manager/addons_manager/addons_cubit.dart';
import 'package:mersal/features/addons_sheet/manager/addons_manager/addons_state.dart';
import 'package:mersal/features/business_screen/model/Product.dart';

import '../../../../core/design/appTexts.dart';
import '../../../../core/design/app_styles.dart';

class MealTitleRow extends StatelessWidget {
  const MealTitleRow({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    var addonsCubit = BlocProvider.of<AddonsCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w,vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                  width: 220.w,
                  child: FittedBox(
                      fit: BoxFit.scaleDown,alignment: AlignmentDirectional.centerStart,
                      child: Styles.text(product.name??'',size: 18,fontWeight: FontWeight.w900))),
              const Spacer(),
              BlocBuilder<AddonsCubit,AddonsState>(
                builder: (context,state)=>SizedBox(
                    width: 120.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if(addonsCubit.selectedSize.discount!=0)
                        FittedBox(
                            fit: BoxFit.scaleDown,alignment: AlignmentDirectional.centerEnd,
                            child: Styles.text('${addonsCubit.selectedSize.discount!} ${Texts.currency}',
                              size: 18,fontWeight: FontWeight.w900,)),
                        if(addonsCubit.selectedSize.discount!=0)SizedBox(width: 10.w,),
                        FittedBox(
                            fit: BoxFit.scaleDown,alignment: AlignmentDirectional.centerEnd,
                            child: Styles.text('${addonsCubit.selectedSize.price!} ${Texts.currency}',
                                color: addonsCubit.selectedSize.discount!=0?Colors.black38:Colors.black,
                                decoration: addonsCubit.selectedSize.discount!=0? TextDecoration.lineThrough:null,
                                size: 18,fontWeight: FontWeight.w900)),
                      ],
                    )),
              )
            ],
          ),
          if(product.notes!.isNotEmpty)SizedBox(height: 10.h),
          if(product.notes!.isNotEmpty)FittedBox(child: Styles.text(product.notes![0].name!,color: Colors.black45,size: 14))
        ],
      ),
    );
  }
}
