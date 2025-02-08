import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/fun_widgets.dart';
import 'package:mersal/core/local_storage/secure_storage.dart';
import 'package:mersal/core/services/api_service.dart';
import 'package:mersal/features/home/data/get_home_res_repo.dart';
import 'package:mersal/features/home/manager/home_cubit/home_cubit.dart';
import 'package:mersal/features/home/view/widgets/cites_sheet.dart';
import 'package:mersal/features/splash/manager/user_data_cubit.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/design/app_styles.dart';

class LogoAndLocationRow extends StatefulWidget {
  const LogoAndLocationRow({super.key, required this.color});
  final Color color;

  @override
  State<LogoAndLocationRow> createState() => _LogoAndLocationRowState();
}

class _LogoAndLocationRowState extends State<LogoAndLocationRow> {
  late int selectedIndex;
  late UserDataCubit dataCubit;
  late HomeCubit homeCubit;
  late UserDataCubit userDataCubit;
  // int cacheId=0,cacheIndex=0;
  // Country cacheCountry = Country();
  @override
  void initState() {
    dataCubit = BlocProvider.of<UserDataCubit>(context);
    homeCubit = BlocProvider.of<HomeCubit>(context);
    userDataCubit = BlocProvider.of<UserDataCubit>(context);
    selectedIndex = dataCubit.countriesList.indexWhere((x)=> x.id==dataCubit.selectedCountry!.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Row(
          children: [
            Styles.text('MERSAL',color: widget.color,size: 20),
            const Spacer(),
            // dataCubit.countriesList.isNotEmpty && dataCubit.countriesList.length>1?
            false?DropdownButton(
              value: selectedIndex,
                underline: const SizedBox(),
                iconEnabledColor: Colors.white,
                dropdownColor: Styles.primary.withOpacity(.7),
                borderRadius: BorderRadius.circular(6),
                items:
                List.generate(dataCubit.countriesList.length, (index){
                  return DropdownMenuItem(
                    value: index,
                    child: Styles.text(dataCubit.countriesList[index].name!,color: Colors.white),
                  );
                }), onChanged: (x)async{
                if(SecureStorage.token==null){
                  await SecureStorage.setCountryId(dataCubit.countriesList[x!].id!.toInt());
                  dataCubit.selectedCountry = dataCubit.countriesList[x!];
                  selectedIndex = x!;
                  ApiService.updateHeader();
                }else{
                  await GetHomeResRepo.setNewCountry(countryId: dataCubit.countriesList[x!].id.toString()).then((_) async {
                    await dataCubit.getReqData();
                    await SecureStorage.setCountryId(dataCubit.countriesList[x!].id!.toInt());
                    dataCubit.selectedCountry = dataCubit.countriesList[x!];
                    selectedIndex = x!;
                    ApiService.updateHeader();
                  }).catchError((error){
                    customDialog(context: context, message: 'حدث خطأ ولم يتم تغير الدولة من فضلك حاول مجددا'.tr());
                  });
                }
                  setState(() {});
                  await homeCubit.getAppBanner();
                  await homeCubit.getHomeRestaurants();
            }):GestureDetector(
                onTap: (){
                  showCupertinoModalBottomSheet(context: context, builder: (context)=> CitesSheet());
                },
                child: Container(
                  color: Colors.transparent,
                    child: Row(
                      children: [
                        Icon(Icons.location_on_rounded,color: widget.color),
                        SizedBox(width: 2.w,),
                        Styles.text(dataCubit.selectedCountry!.name.toString(),color: Colors.white),
                      ],
                    )
                ))
          ],
        ),
      ),
    );
  }
}
