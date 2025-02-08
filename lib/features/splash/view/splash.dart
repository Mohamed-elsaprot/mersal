import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/core/design/fun_widgets.dart';
import 'package:mersal/core/local_storage/secure_storage.dart';
import 'package:mersal/core/router.dart';
import 'package:mersal/features/requirments/manager/requirements_cubit.dart';
import 'package:mersal/features/splash/manager/user_data_cubit.dart';
import 'package:mersal/features/splash/manager/user_data_state.dart';

import '../../../core/services/api_service.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late UserDataCubit userDataCubit;
  late RequirementsCubit requirementsCubit;
  int end = 0;
  @override
  void initState() {
    userDataCubit = BlocProvider.of<UserDataCubit>(context);
    requirementsCubit = BlocProvider.of<RequirementsCubit>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDataCubit,UserDataState>(builder: (context,state){
      return Scaffold(
        backgroundColor: Styles.primary,
        body: Center(
          child: Styles.text('MERSAL',color:  Colors.white,size: 50,fontWeight: FontWeight.w900,letterSpacing: 16)
              .animate().fade(duration: const Duration(seconds: 1),).slideY(duration: const Duration(milliseconds: 800),begin: -1),
        ),
      );
    }, listener: (context,state)async{

      if(state is UserDataFailure) customDialog(context: context, message: state.errorMessage);
      if(state is UserDataSuccess){
        Future.delayed(const Duration(milliseconds: 1200), () async {
          if(SecureStorage.lang==null || SecureStorage.countryId==null){

            if(userDataCubit.langList.length==1){
              SecureStorage.setLang(userDataCubit.langList[0].locale!);
              userDataCubit.selectedLang=userDataCubit.langList[0];
              await context.setLocale(Locale(userDataCubit.selectedLang!.locale!.toLowerCase()));
              requirementsCubit.changePage(1);
            }
            if(userDataCubit.countriesList.length==1){
              SecureStorage.setCountryId(userDataCubit.countriesList[0].id!.toInt());
              userDataCubit.selectedCountry=userDataCubit.countriesList[0];
              ApiService.updateHeader();
            }
            AppRouter.router.pushReplacement(AppRouter.req);
          }else{
            userDataCubit.getSelected();
            if(userDataCubit.selectedLang==null||userDataCubit.selectedCountry==null){
              AppRouter.router.pushReplacement(AppRouter.req);
            }else{
              AppRouter.router.pushReplacement(AppRouter.navigationScreen);
            }
          }
        },);
      }
    });
  }
}
