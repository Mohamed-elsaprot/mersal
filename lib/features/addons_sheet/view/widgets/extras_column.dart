import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/features/addons_sheet/manager/addons_manager/addons_cubit.dart';
import 'package:mersal/features/addons_sheet/manager/check_req_cubit/check_req_cubit.dart';
import 'package:mersal/features/addons_sheet/manager/check_req_cubit/check_req_state.dart';
import 'package:mersal/features/business_screen/model/Groups.dart';

import '../../manager/extra_animation_cubit/extra_count_limit_cubit.dart';
import '../../manager/extra_animation_cubit/extra_count_limit_state.dart';
import 'extra_check_row.dart';
import 'addon_title_row.dart';

class ExtrasCheckBoxColumn extends StatelessWidget {
  const ExtrasCheckBoxColumn({super.key, required this.group, required this.groupIndex,});
  final Groups group;
  final int groupIndex;
  @override
  Widget build(BuildContext context) {
    var extraCountLimitCubit = BlocProvider.of<ExtraCountLimitCubit>(context);
    var addonsCubit = BlocProvider.of<AddonsCubit>(context);
    return Column(
      children: [
        AddonTitleRow(t1: group.name??'',required: group.isRequired,),
        SizedBox(height: 10.h,),
        BlocBuilder<CheckReqCubit,CheckReqState>(builder: (context,state){
          return Row(
            children: [
              BlocBuilder<ExtraCountLimitCubit,ExtraCountLimitState>(builder: (context,state){
                return Row(
                  children: [
                    Styles.text('الحد الأقصى'.tr(),size: 12,color: Colors.black54),
                    Styles.text(' ${group.quantity.toString()} ',size: 12,color: Colors.black54),
                    Styles.text('من الاضافات'.tr(),size: 12,color: Colors.black54),
                  ],
                ).animate(target: extraCountLimitCubit.target,).shake(curve: Curves.linear);
              }
              ),
              if(addonsCubit.addToCartClicked)...List.generate(addonsCubit.reqIndexGroups.length, (index)=>
              !addonsCubit.reqIndexGroups[index]['done'] && addonsCubit.reqIndexGroups[index]['index']==groupIndex?
              Styles.text('مطلوب'.tr(),color: Colors.redAccent).animate().shake():const SizedBox()
              )
            ],
          );
        }),
        SizedBox(height: 10.h,),
        ...List.generate(group.extras!.length, (index)=>
            ExtraCheckRow(extra: group.extras![index],group: group,groupIndex: groupIndex,extraIndex: index,)
        ),
    ]

    );
  }
}
