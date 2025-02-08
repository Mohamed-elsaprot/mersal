import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/fun_widgets.dart';

class BusinessShimmer extends StatelessWidget {
  const BusinessShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 250.h),
        child: Stack(
          children: [
            shimmerWidget(height: 200.h, width: double.infinity),
            Align(
                alignment: Alignment.bottomCenter,
                child: shimmerWidget(height: 150.h, width: 150.h,rad: 100,color: Colors.black)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                shimmerWidget(height: 20, width: 150.w,rad: 20),
                const SizedBox(width: 10,),
                shimmerWidget(height: 20, width: 50.w,rad: 20),
                const SizedBox(width: 10,),
                shimmerWidget(height: 20, width: 50.w,rad: 20),
              ],
            ),
            const SizedBox(height: 20,),
            shimmerWidget(height: 35.h, width: 160.w,rad: 8),
            const SizedBox(height: 8,),
            shimmerWidget(height: 22.h, width: 200.w,rad: 8),
            const SizedBox(height: 25,),
            Align(alignment: AlignmentDirectional.centerStart,child: shimmerWidget(height: 25.h, width: 100,rad: 8),),
            const SizedBox(height: 25,),
            ...List.generate(8, (index)=> shimmerWidget(height: 150.h, width: double.maxFinite,rad: 12,margin: EdgeInsets.symmetric(vertical: 8.h)))
          ],
        ),
      ),
    );
  }
}
