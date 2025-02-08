import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/check_out/manager/check_out_state.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/general_widgets/method_widget.dart';
import '../../manager/check_out_cubit.dart';

class DeliveryMethodButton extends StatefulWidget {
  const DeliveryMethodButton({super.key});

  @override
  State<DeliveryMethodButton> createState() => _DeliveryMethodButtonState();
}

class _DeliveryMethodButtonState extends State<DeliveryMethodButton> {

  late CheckOutCubit checkOutCubit;
  @override
  void initState() {
    checkOutCubit = BlocProvider.of<CheckOutCubit>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Styles.primaryButtons
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MethodWidget(title: 'توصيل'.tr(), chosen: checkOutCubit.deliveryMethod==0, fun: ()=> setState(() {checkOutCubit.deliveryMethod=0;checkOutCubit.emit(CheckOutInitial());})),
          MethodWidget(title: 'استلام ذاتي'.tr(), chosen: checkOutCubit.deliveryMethod==1, fun: ()=>setState(() {checkOutCubit.deliveryMethod=1;checkOutCubit.emit(CheckOutInitial());})),
        ],
      ),
    );
  }
}
