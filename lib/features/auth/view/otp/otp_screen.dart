import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/fun_widgets.dart';
import 'package:mersal/features/auth/view/otp/widgets/otp_text_field.dart';
import 'package:mersal/features/splash/manager/user_data_cubit.dart';
import 'package:mersal/features/splash/manager/user_data_state.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';
import '../../../../core/general_widgets/custom_button.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_state.dart';
import '../phone/widgets/phone_sheet_close_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late final FocusNode focusNode;
  // late UserDataCubit userDataCubit;
  late final GlobalKey<FormState> formKey;
  @override
  void initState() {
    // userDataCubit = BlocProvider.of<UserDataCubit>(context);
    formKey = GlobalKey<FormState>();
    focusNode = FocusNode();
    focusNode.requestFocus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.h,
          elevation: 0,scrolledUnderElevation: 0,automaticallyImplyLeading: false,backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Styles.text('الرمز المتغير',size: 22).tr(),
              const Spacer(),
              const SheetCloseButton()
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(25.sp),
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50.h,),
                Image.asset(Images.otp,height: 110.h,),
                SizedBox(height: 15.h,),
                Styles.text('لمتابعة تسجيل الدخول',size: 22).tr(),
                SizedBox(height: 15.h,),
                Styles.subTitle('من فضلك ادخل الرمز المتغير',size: 16,color: Colors.black54).tr(),
                SizedBox(height: 50.h,),
                Form(key: formKey,child: OtpTextField(focusNode: focusNode)),
                SizedBox(height: 30.h,),
                BlocBuilder<AuthCubit,AuthState>(builder: (context,state){
                  if(state is AuthLoading){
                    return SizedBox(width: double.infinity,height: 60.h,child: CustomButton(rad: 12,fun: (){}, title: '',titleWidget: const CircularProgressIndicator(color: Colors.white,),));
                  }else{
                    return SizedBox(
                        width: double.infinity,height: 60.h,
                        child: CustomButton(
                          fun: () async {
                            if(formKey.currentState!.validate()){
                              focusNode.unfocus();
                              formKey.currentState!.save();
                            }
                          }, title: 'تأكيد'.tr(),textSize: 20,rad: 12,));
                  }
                })

              ],
            ),
          ),
        ),
      ),
    );
  }
}
