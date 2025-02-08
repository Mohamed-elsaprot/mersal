import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../consts.dart';
import '../../../../core/design/app_styles.dart';
import '../../manager/check_out_cubit.dart';

class LocDetailsTextField extends StatelessWidget {
  const LocDetailsTextField({super.key});

  @override
  Widget build(BuildContext context) {
    var checkOutCubit = BlocProvider.of<CheckOutCubit>(context);
    return Column(
      children: [
        Row(
          children: [
            Styles.text('*',color: Colors.red),
            const SizedBox(width: 5,),
            Styles.text('عنوانكم بالتفصيل'.tr()),
            const SizedBox(width: 5,),
            Styles.subTitle('(اجباري)'.tr(),size: 14),
          ],
        ),
        const SizedBox(height: 5,),
        TextFormField(
          validator: (x){
            if(x==null||x.isEmpty){
              return '';
            } return null;
          },
          onChanged: (x){
            checkOutCubit.address = x;
          },
          cursorColor: Styles.primary,
          style: const TextStyle(fontFamily: fontFamily,fontWeight: FontWeight.w700),
          decoration: InputDecoration(
            // label: Styles.text('عنوانكم بالتفصيل'.tr()),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.black)),
          ),
        ),
      ],
    );
  }
}
