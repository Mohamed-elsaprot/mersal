import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/core/design/app_styles.dart';

import '../../../../../consts.dart';
import '../../../manager/auth_cubit.dart';
import '../../../manager/auth_state.dart';

class CustomTextField extends StatelessWidget {
   const CustomTextField({super.key, required this.controller, required this.icon, required this.hint, required this.keyboard, this.validator, this.rad=12, this.textAlign=TextAlign.end,});
  final TextEditingController controller;
  final Widget icon;
  final String hint;
  final TextInputType keyboard;
  final String? Function(String?)? validator;
  final double rad;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(builder: (context,state) {
      return TextFormField(
        controller: controller,
        validator: validator??(x){
          if(x!.isEmpty) return '';
        },
        keyboardType: keyboard,
        textAlign: textAlign,
          cursorColor: Styles.primary,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontFamily: fontFamily,color: Colors.black38,),
            suffixIcon: icon,
            border: border(rad: rad),
            focusedBorder: border(rad: rad),
            focusColor: Colors.black12,
            enabledBorder: border(rad: rad),
            filled: true,fillColor: const Color(0xfff6f6f6)
        ));
    });
  }
  border({required double rad}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(rad),
        borderSide: const BorderSide(width: 0, color: Colors.transparent));
  }
}
