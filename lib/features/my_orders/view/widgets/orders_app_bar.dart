import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/router.dart';
import 'orders_type_button.dart';

class OrdersAppBar extends StatelessWidget {
  const OrdersAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              Styles.text('طلباتك'.tr(), size: 22),
              const Spacer(),
              CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                radius: 18,
                child: IconButton(
                  icon: const Icon(Icons.close, size: 20,),
                  onPressed: () {
                    AppRouter.router.pop();
                  },
                ),
              )
            ],
          ),
          SizedBox(height: 40.h,),
          const OrdersTypeButton(),
        ],
      ),
    );
  }
}
