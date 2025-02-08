import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/features/business_screen/model/product_comp_extra.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun_widgets.dart';
import '../../manager/addons_manager/addons_cubit.dart';

class CompCheckRow extends StatefulWidget {
  const CompCheckRow({super.key, required this.compExtra, required this.comIndex,});
  final ProductCompExtra compExtra;
  final int comIndex;
  @override
  State<CompCheckRow> createState() => _CompCheckRowState();
}

class _CompCheckRowState extends State<CompCheckRow> {
  late AddonsCubit addonsCubit;
  late bool val,taped=false;
  onChange(x) async {
    val = !val;
    addonsCubit.updateCompList(val: val, compIndex: widget.comIndex, compExtra: widget.compExtra);
    setState(() {});
  }
  @override
  void initState() {
    addonsCubit = BlocProvider.of<AddonsCubit>(context);
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
        margin: EdgeInsets.only(bottom: 5.h),
        height: 25.h,
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  AnimatedScale(
                    duration: const Duration(milliseconds: 100 ),
                    scale: taped? 1.3:1,
                    child: Container(
                      width: 22,height: 22,
                      alignment: Alignment.center,
                      margin: const EdgeInsetsDirectional.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: val?null:Border.all(width: 1.2,color: Colors.black),
                          color: val?Styles.primary:null
                      ),
                      child: val? const Icon(Icons.check,color: Colors.white,size: 19,):null,
                    ),
                  ),
                  SizedBox(
                      height: 22.h,width: 22.w,
                      child: cachedImage(widget.compExtra.image??'',smallImage: true,boxFit: BoxFit.fill,)),
                  SizedBox(width: 10.w,),
                  Styles.text('${'بدون'.tr()} ${widget.compExtra.name??''}',color: Colors.black87,size: 13),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
