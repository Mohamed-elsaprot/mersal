import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/core/general_widgets/custom_button.dart';
import 'package:mersal/core/local_storage/secure_storage.dart';
import 'package:mersal/core/services/api_service.dart';
import 'package:mersal/features/auth/manager/auth_cubit.dart';
import 'package:mersal/features/auth/manager/auth_state.dart';
import 'package:mersal/features/settings/manager/settings_cubit.dart';
import 'package:mersal/features/settings/manager/settings_state.dart';
import 'package:mersal/features/splash/manager/user_data_cubit.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../auth/view/phone/phone_auth_screen.dart';
import 'content_screen.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  late SettingsCubit settingsCubit;
  late UserDataCubit dataCubit;

  @override
  void initState() {
    settingsCubit = BlocProvider.of<SettingsCubit>(context);
    dataCubit = BlocProvider.of<UserDataCubit>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0,270.h),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,height: 250.h,
                decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,end: Alignment.topCenter,
                    colors: [
                      Styles.primaryShad.withOpacity(.5),
                      Colors.white60,
                      Colors.white60,
                      Colors.white,
                ])
              ),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: Styles.text('MERSAL',size: 25,fontWeight: FontWeight.w900),
                  )),
            ),
            BlocBuilder<AuthCubit,AuthState>(builder: (context,state){
               return SecureStorage.token!=null?Positioned(
                 bottom: 15,
                 child: Container(
                   height: 90.h,width: 250.w,
                   padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 10.h),
                   child:dataCubit.infoModel!=null? Column(
                     mainAxisSize: MainAxisSize.min,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       FittedBox(fit: BoxFit.scaleDown, child: Styles.text(dataCubit.infoModel!.name??'',size: 30,fontWeight: FontWeight.w900)),
                       FittedBox(fit: BoxFit.scaleDown,child: Styles.text(dataCubit.infoModel!.phone??'',fontWeight: FontWeight.w500)),
                     ],
                   ):const SizedBox(),
                 ),
               ):const SizedBox();
            })
          ],
        ),
      ),
      body: BlocBuilder<SettingsCubit,SettingsState>(
      builder: (context, state) {
        return ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
            children: [
              ...List.generate(settingsCubit.pagesList.length, (index){
                  return Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          backGroundColor: Styles.primaryShad.withOpacity(.5),rad: 6,textColor: Colors.black,textSize: 20,  title: settingsCubit.pagesList[index].defaultName??'',
                          fun: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=> ContentScreen(contentPage: settingsCubit.pagesList[index],))),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                    ],
                  );
              }),
              CustomButton(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                backGroundColor: Styles.primaryShad.withOpacity(.5),rad: 6,textColor: Colors.black,textSize: 20,
                title:SecureStorage.token==null?'تسجيل الدخول'.tr(): 'تسجيل الخروج'.tr(),
                fun: () async {
                  if(SecureStorage.token==null){
                    showCupertinoModalBottomSheet(
                      expand: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const AuthScreen(),
                    );
                  }else{
                    await SecureStorage.deleteToken();
                    await ApiService.updateHeader();
                    setState(() {});
                  }
                },
              ),
            ],
          );
      },),
    );
  }
}
