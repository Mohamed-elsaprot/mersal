import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/features/addons_sheet/manager/addons_manager/addons_cubit.dart';
import 'package:mersal/features/addons_sheet/view/widgets/addons_counter_button.dart';
import 'package:mersal/features/business_screen/model/Groups.dart';
import 'package:mersal/features/business_screen/model/product_extra.dart';

import '../../../../core/design/appTexts.dart';
import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun_widgets.dart';
import '../../../../core/design/images.dart';
import '../../manager/extra_animation_cubit/extra_count_limit_cubit.dart';

class ExtraCheckRow extends StatefulWidget {
  const ExtraCheckRow({super.key, required this.extra, required this.group, required this.groupIndex, required this.extraIndex});
  final ProductExtras extra;
  final Groups group;
  final int groupIndex,extraIndex;
  @override
  State<ExtraCheckRow> createState() => _ExtraCheckRowState();
}

class _ExtraCheckRowState extends State<ExtraCheckRow> {
  late AddonsCubit addonsCubit;
  late ExtraCountLimitCubit extraCountLimitCubit;
  late bool val,taped=false;
  onChange(x) async {
    if(val==false&&widget.group.quantity!<=addonsCubit.extrasIdList[widget.groupIndex].length){
      if(extraCountLimitCubit.target==1) {
        extraCountLimitCubit.changeAnimationTarget(2);
      }else {
        extraCountLimitCubit.changeAnimationTarget(1);
      }
    }else{
      val = !val;
      await addonsCubit.updateExtrasList(val: val, extraIndex: widget.extraIndex,groupIndex: widget.groupIndex, extra: widget.extra,);
      extraCountLimitCubit.changeAnimationTarget(0);
      setState(() {});
    }

  }
  @override
  void initState() {
    addonsCubit = BlocProvider.of<AddonsCubit>(context);
    extraCountLimitCubit = BlocProvider.of<ExtraCountLimitCubit>(context);
    val = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onChange!(val);
        setState(() {});
      },
      onPanDown: (x)=>setState(() => taped=true),
      onPanCancel: ()=>setState(() => taped=false),
      child: Container(
        margin: EdgeInsets.only(bottom: 4.h),
        padding: EdgeInsetsDirectional.only(end: 10.w),
        height: 25.h,
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  AnimatedScale(
                    scale: taped?1.3:1,
                    duration: const Duration(milliseconds: 100),
                    child: Container(
                      width: 22,height: 22,
                      alignment: Alignment.center,
                      margin: const EdgeInsetsDirectional.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: val?null:Border.all(width: 1.2,color: Colors.black),
                          color: val?Styles.primary:null
                      ),
                      child: val? FittedBox(
                        child: Text(addonsCubit.extrasList[widget.groupIndex][widget.extraIndex].quantity!.toString(),
                          style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.bold),),
                      ):null,
                    ),
                  ),
                  SizedBox(
                      height: 22.h,width: 22.w,
                      child: cachedImage(widget.extra.image??'',smallImage: true,boxFit: BoxFit.fill,)),
                  SizedBox(width: 10.w,),
                  FittedBox(child: Styles.text(widget.extra.name??'',color: Colors.black87,size: 13)),
                  SizedBox(width: 15.w,),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if(widget.group.quantityControl! && val)Expanded(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Styles.primaryButtons,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AddonsCounterButton(fun: (){
                                if(addonsCubit.extrasList[widget.groupIndex][widget.extraIndex].quantity!>1) {
                                  addonsCubit.updateExtraCount(groupIndex: widget.groupIndex, extraIndex: widget.extraIndex,add: false);
                                }else{
                                  onChange(val);
                                }
                                setState(() {});
                              }, image: Images.minAddons),
                              const VerticalDivider(endIndent: 4,indent: 4,thickness: 3,width: 25,),
                              AddonsCounterButton(fun: (){
                                addonsCubit.updateExtraCount(groupIndex: widget.groupIndex, extraIndex: widget.extraIndex,add: true);
                                setState(() {});
                              }, image: Images.plusAddons),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Styles.subTitle('${widget.extra.price}'
                          '${Texts.currency}',size: 11,)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}