import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/features/addons_sheet/view/widgets/comp_check_row.dart';
import 'package:mersal/features/business_screen/model/product_comp_extra.dart';

import 'addon_title_row.dart';

class CompColumn extends StatelessWidget {
  const CompColumn({super.key, required this.compExtraList,});
  final List<ProductCompExtra> compExtraList;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          if(compExtraList.isNotEmpty)AddonTitleRow(t1: 'المكونات الشاملة'.tr(),),
          if(compExtraList.isNotEmpty)SizedBox(height: 12.h,),
          ...List.generate(compExtraList.length, (index)=>
              CompCheckRow(compExtra: compExtraList[index],comIndex: index,)
          ),
        ]

    );
  }
}
