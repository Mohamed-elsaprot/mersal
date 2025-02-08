import'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../manager/auth_cubit.dart';
import '../../../manager/auth_state.dart';

class AuthTypeContainer extends StatelessWidget {
  const AuthTypeContainer({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<AuthCubit,AuthState>(builder: (context,state){
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade300,
        ),
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  authCubit.changeAuthType('login');
                },
                child: Container(
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: authCubit.authType=='login'? Colors.white:Colors.transparent,
                    ),
                    child: Styles.text('تسجيل الدخول'.tr(),color: authCubit.authType=='login'? Colors.black:Colors.black38).tr()),
              ),
            ),
            SizedBox(width: 3.w,),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  authCubit.changeAuthType('signUp');
                },
                child: Container(
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: authCubit.authType=='signUp'? Colors.white:Colors.transparent,
                    ),
                    child: Styles.text('انشاء حساب'.tr(),color: authCubit.authType=='signUp'? Colors.black:Colors.black38).tr()),
              ),
            ),
          ],
        ),
      );
    });
  }
}
