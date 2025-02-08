import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/core/general_widgets/custom_button.dart';

import '../../../../core/design/fun_widgets.dart';
import '../../../../core/local_storage/secure_storage.dart';
import '../../../../core/services/api_service.dart';
import '../../../splash/manager/user_data_cubit.dart';
import '../../data/get_home_res_repo.dart';
import '../../manager/home_cubit/home_cubit.dart';

class CitesSheet extends StatefulWidget {
  const CitesSheet({super.key});

  @override
  State<CitesSheet> createState() => _CitesSheetState();
}

class _CitesSheetState extends State<CitesSheet> {
  late UserDataCubit dataCubit;
  late HomeCubit homeCubit;
  late int selectedIndex;
  @override
  void initState() {
    dataCubit = BlocProvider.of<UserDataCubit>(context);
    selectedIndex = dataCubit.countriesList.indexWhere((con)=>con.id==dataCubit.selectedCountry!.id!);
    homeCubit = BlocProvider.of<HomeCubit>(context);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sheetApBar(title: 'اختر المدينة'.tr()),
      body: ListView.separated(
          itemBuilder: (context,index)=>RadioListTile(
              value: index, groupValue: selectedIndex,
              activeColor: Styles.primary,title: Styles.text(dataCubit.countriesList[index].name??''),
              onChanged: (x){
                setState(() {
                  selectedIndex=x!;
                });
          }),
          separatorBuilder: (context,index)=>SizedBox(height: 0.h,),
          itemCount: dataCubit.countriesList.length
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w,),
        margin: EdgeInsets.only(bottom: 25.h),
        height: 50.h,
        child: CustomButton(fun: () async {
          if(SecureStorage.token==null){
            await SecureStorage.setCountryId(dataCubit.countriesList[selectedIndex].id!.toInt());
            dataCubit.selectedCountry = dataCubit.countriesList[selectedIndex];
            ApiService.updateHeader();
          }else{
            await GetHomeResRepo.setNewCountry(countryId: dataCubit.countriesList[selectedIndex].id.toString()).then((_) async {
              await dataCubit.getReqData();
              await SecureStorage.setCountryId(dataCubit.countriesList[selectedIndex].id!.toInt());
              dataCubit.selectedCountry = dataCubit.countriesList[selectedIndex];
              ApiService.updateHeader();
            }).catchError((error){
              customDialog(context: context, message: 'حدث خطأ ولم يتم تغير الدولة من فضلك حاول مجددا'.tr());
            });
          }
          Navigator.pop(context);
          await homeCubit.getAppBanner();
          await homeCubit.getHomeRestaurants();
        }, title: 'اختيار المدينة'.tr()),
      ),
    );
  }
}
