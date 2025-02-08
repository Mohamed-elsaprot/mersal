import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/features/addons_sheet/manager/addons_manager/addons_cubit.dart';
import 'package:mersal/features/business_screen/model/Sizes.dart';

import '../../../../core/design/appTexts.dart';
import '../../../../core/design/app_styles.dart';

class SizeRadioRow extends StatefulWidget {
  const SizeRadioRow({super.key, required this.size});
  final Size size;
  @override
  State<SizeRadioRow> createState() => _SizeRadioRowState();
}

class _SizeRadioRowState extends State<SizeRadioRow> {
  late AddonsCubit addonsCubit;
  @override
  void initState() {
    addonsCubit = BlocProvider.of<AddonsCubit>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        addonsCubit.setNewSize(widget.size);
      },
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
                  Radio(value: widget.size.id!, groupValue: addonsCubit.selectedSizeId,
                      activeColor: Styles.primary,
                      onChanged: (x){
                    addonsCubit.setNewSize(widget.size);
                  }),
                  FittedBox(child: Styles.text(widget.size.name??'No Name',color: Colors.black87)),
                  SizedBox(width: 15.w,),
                ],
              ),
            ),
            FittedBox(
                fit: BoxFit.scaleDown,
                child: Styles.subTitle('${widget.size.price??''} ${Texts.currency}',size: 11,)),
          ],
        ),
      ),
    );
  }
}
