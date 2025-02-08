import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/check_out/manager/check_out_cubit.dart';
import 'package:mersal/features/check_out/manager/check_out_state.dart';
import 'package:mersal/features/check_out/manager/check_out_state.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/general_widgets/method_widget.dart';

class PaymentMethodButton extends StatefulWidget {
  const PaymentMethodButton({super.key});

  @override
  State<PaymentMethodButton> createState() => _PaymentMethodButtonState();
}

class _PaymentMethodButtonState extends State<PaymentMethodButton> {
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
          MethodWidget(title: 'كاش'.tr(), chosen: checkOutCubit.paymentMethod==0, fun: ()=> setState(() {
            checkOutCubit.paymentMethod=0;
            checkOutCubit.emit(ChangeCashQuote());
          })),
          MethodWidget(title: 'فيزا'.tr(), chosen: checkOutCubit.paymentMethod==1, fun: ()=>setState(() {
            checkOutCubit.paymentMethod=1;
            checkOutCubit.emit(ChangeCashQuote());
          })),
        ],
      ),
    );
  }
}
