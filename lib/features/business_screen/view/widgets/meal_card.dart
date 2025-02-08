import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/features/addons_sheet/view/addons_sheet.dart';
import 'package:mersal/features/business_screen/model/Product.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/design/appTexts.dart';
import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun_widgets.dart';
import '../../manager/rest_details_cubit/rest_details_cubit.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        showCupertinoModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<RestDetailsCubit>(context),
            child: AddonsSheet(product: product,),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.black12,blurRadius: 3,offset: Offset(3,3))
            ]
        ),
        margin: EdgeInsets.symmetric(vertical: 8.h),
        height: 140.h,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(top: 12.h,bottom: 8.h,start: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 25.h,
                            child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Styles.text(product.name??'',size: 22,overflow: TextOverflow.ellipsis))),
                        if(product.desc!=null&&product.desc!='')Padding(
                          padding: const EdgeInsetsDirectional.only(end: 30),
                          child: Styles.text(product.desc??'',size: 12,maxLine: 3,overflow: TextOverflow.ellipsis),
                        ),
                        FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Styles.text('${product.sizes![0].price} ${Texts.currency}',size: 18,color: Styles.primary)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: ClipRRect(
                        borderRadius: const BorderRadiusDirectional.horizontal(end: Radius.circular(10)),
                        child: cachedImage(product.images?[0].image??'',boxFit: BoxFit.cover)
                    )
                ),
              ],
            ),
            Center(
              child: InkWell(
                onTap: (){
                  showCupertinoModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<RestDetailsCubit>(context),
                      child: AddonsSheet(product: product,),
                    ),
                  );
                },
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: Styles.primaryShad,
                  child: Icon(Icons.add,color: Styles.primary,size: 30,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
