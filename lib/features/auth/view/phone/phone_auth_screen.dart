import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/features/auth/manager/auth_state.dart';
import 'package:mersal/features/auth/view/phone/widgets/auth_button.dart';
import 'package:mersal/features/auth/view/phone/widgets/auth_type_container.dart';
import 'package:mersal/features/auth/view/phone/widgets/phone_sheet_close_button.dart';
import 'package:mersal/features/auth/view/phone/widgets/phone_text_field.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';
import '../../manager/auth_cubit.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthCubit authCubit;
  late TextEditingController phoneController,nameController;
  @override
  void initState() {
    authCubit = BlocProvider.of<AuthCubit>(context);
    phoneController = TextEditingController(); nameController = TextEditingController();
    super.initState();
  }
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(
      builder:(context,state)=> ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70.h,
            elevation: 0,scrolledUnderElevation: 0,automaticallyImplyLeading: false,backgroundColor: Colors.transparent,
            title: Row(
              children: [
                Styles.text(authCubit.authType=='login'?'تسجيل الدخول'.tr():'انشاء حساب',size: 22),
                const Spacer(),
                const SheetCloseButton()
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(25.sp),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 140.h,),
                  Image.asset(Images.logIn,height: 110.h,),
                  SizedBox(height: 15.h,),
                  Styles.text('مرحبا بك زائرنا العزيز',size: 24).tr(),
                  // SizedBox(height: 30.h,),
                  // AuthTypeContainer( controller: phoneController),
                  SizedBox(height: 25.h,),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        if(authCubit.authType=='signUp')CustomTextField(
                          controller: nameController,
                          icon: const Icon(Icons.person),
                          hint: 'اسم المستخدم'.tr(), keyboard: TextInputType.text,
                        ),
                        if(authCubit.authType=='signUp')SizedBox(height: 15.h,),
                        CustomTextField(
                          controller: phoneController,
                          icon: Container(width: 65.w,alignment: Alignment.center,child: Styles.subTitle('972+',size: 16)),
                          hint: 'ادخل رقم الهاتف'.tr(), keyboard: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  SizedBox(
                      width: double.infinity,
                      child: AuthButton(
                        fun: ()async{
                          if(formKey.currentState!.validate()){
                            authCubit.auth(userPhone: phoneController.text,userName: nameController.text);
                            }
                          } ,title: authCubit.authType=='login'? 'تسجيل الدخول'.tr():'انشاء حساب'.tr(),rad: 12,textSize: 20,)
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
