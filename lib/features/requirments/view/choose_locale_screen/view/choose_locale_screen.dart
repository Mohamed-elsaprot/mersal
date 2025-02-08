import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/core/general_widgets/sec_button.dart';
import 'package:mersal/core/local_storage/secure_storage.dart';
import 'package:mersal/features/splash/manager/user_data_cubit.dart';

import '../../../manager/requirements_cubit.dart';

class LocaleScreen extends StatelessWidget {
  const LocaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var reqCubit = BlocProvider.of<RequirementsCubit>(context);
    var userDataCubit = BlocProvider.of<UserDataCubit>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Styles.text('MERSAL',size: 30,),centerTitle: true,backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: Column(
          children: [
            SizedBox(height: 100.h,),
            Lottie.asset('assets/animation/locale.json'),
            SizedBox(height: 80.h,),
            ...List.generate(userDataCubit.langList.length, (index)=>
                Column(
                  children: [
                    SecButton(
                        title: userDataCubit.langList[index].name??'',
                        fun: ()async{
                          SecureStorage.setLang(userDataCubit.langList[index].locale!);
                          userDataCubit.selectedLang=userDataCubit.langList[index];
                          await context.setLocale(Locale(userDataCubit.selectedLang!.locale!.toLowerCase()));
                          reqCubit.changePage(1);
                        }
                    ),
                    SizedBox(height: 20.h,),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
