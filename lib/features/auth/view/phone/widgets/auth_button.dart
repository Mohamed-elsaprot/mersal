import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/fun_widgets.dart';
import 'package:mersal/features/auth/view/otp/otp_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../manager/auth_cubit.dart';
import '../../../manager/auth_state.dart';


class AuthButton extends StatelessWidget {
  const AuthButton({super.key,required this.fun, required this.title,this.textSize=15, this.rad=50,});
  final void Function() fun;
  final String title;
  final double textSize;
  final double? rad;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(rad!.r,),
              side: const BorderSide(color:Colors.black26,width: 1.5),
            ),
            backgroundColor: Styles.primary
        ),
        onPressed: fun,
        child: BlocConsumer<AuthCubit,AuthState>(
            listener: (context,state){
              if(state is AuthFailure)customDialog(context: context, message: state.errorMessage);
              if(state is AuthSuccess) {
                Navigator.pop(context);
                Future.delayed(
                  const Duration(milliseconds: 250),
                  () {
                    showCupertinoModalBottomSheet(context: context, backgroundColor: Colors.transparent, builder: (context) => const OtpScreen(),);
                    customDialog(context: context, message: BlocProvider.of<AuthCubit>(context).code.toString());
                  },
                );
              }
            },
            builder: (context,state){
              if(state is AuthLoading){
                return const CircularProgressIndicator(color: Colors.white,);
              }else{
                return Styles.text(title,color:Colors.white,size: textSize);
              }
        }),
      ),
    );
  }
}
