import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/features/addons_sheet/manager/addons_manager/addons_cubit.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';
import 'counter_icon.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({super.key});

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  late AddonsCubit addonsCubit;
  @override
  void initState() {
    addonsCubit = BlocProvider.of<AddonsCubit>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Styles.primaryShad,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CounterIcon(image: Images.add, fun: (){
            addonsCubit.changeCount(add: true);
            setState(() {});
          }),
          Container(width: 45.w,alignment: Alignment.center,child: FittedBox(fit: BoxFit.scaleDown,child: Styles.text(addonsCubit.count.toString(),size: 18)),),
          CounterIcon(image: Images.min, fun: (){
            addonsCubit.changeCount(add: false);
            setState(() {});
          }),
        ],
      ),
    );
  }
}
