import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/features/addons_sheet/manager/addons_manager/addons_cubit.dart';
import 'package:mersal/features/addons_sheet/manager/addons_manager/addons_state.dart';
import 'package:mersal/features/addons_sheet/view/widgets/size_radio_row.dart';

import '../../../business_screen/model/Sizes.dart';
import 'addon_title_row.dart';

class SizeColumn extends StatelessWidget {
  const SizeColumn({super.key, required this.sizesList});
  final List<Size> sizesList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddonsCubit,AddonsState>(builder: (context,state){
      return Column(
        children: [
          AddonTitleRow(t1: 'الحجم'.tr().tr()),
          SizedBox(height: 12.h,),
          ...List.generate(sizesList.length, (index)=>
              SizeRadioRow(size: sizesList[index],)
          )
        ],
      );
    });
  }
}
