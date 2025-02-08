import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mersal/core/local_storage/secure_storage.dart';
import 'package:mersal/core/router.dart';
import 'package:mersal/core/services/api_service.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../core/general_widgets/sec_button.dart';
import '../../../../splash/manager/user_data_cubit.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userDataCubit = BlocProvider.of<UserDataCubit>(context);
    return Scaffold(
      appBar: AppBar(title: Styles.text('MERSAL',size: 30,),centerTitle: true,backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: Column(
          children: [
            SizedBox(height: 100.h,),
            Lottie.asset('assets/animation/location.json'),
            SizedBox(height: 80.h,),
            ...List.generate(userDataCubit.countriesList.length, (index)=>
                Column(
                  children: [
                    SecButton(
                        title: userDataCubit.countriesList[index].name??'',
                        fun: ()async{
                          SecureStorage.setCountryId(userDataCubit.countriesList[index].id!.toInt());
                          userDataCubit.selectedCountry=userDataCubit.countriesList[index];
                          ApiService.updateHeader();
                          AppRouter.router.pushReplacement(AppRouter.navigationScreen);
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
