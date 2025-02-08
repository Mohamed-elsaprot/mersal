import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/cart/manager/cart_cubit.dart';
import 'package:mersal/features/check_out/manager/check_out_cubit.dart';
import 'package:mersal/features/splash/manager/user_data_cubit.dart';

import '../../../../core/design/app_styles.dart';
import '../../manager/delivery_cubit/delivery_cost_cubit.dart';

class LocationDropDown extends StatelessWidget {
  const LocationDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    var userDataCubit = BlocProvider.of<UserDataCubit>(context);
    var checkOutCubit = BlocProvider.of<CheckOutCubit>(context);
    var deliveryCubit = BlocProvider.of<DeliveryCostCubit>(context);
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return DropdownButtonFormField(
      validator: (x){
        if(checkOutCubit.cityId==-1){
          return '';
        }return null;
      },
        dropdownColor: Colors.white,
        decoration: InputDecoration(
            label: Styles.text('يرجى اختيار المنطقة'.tr()),
            prefixIcon: const Icon(Icons.location_on_rounded,color: Colors.black,),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.black)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.black))
        ),
        items: List.generate(userDataCubit.infoModel!.infoCountry!.cities!.length, (index){
          return DropdownMenuItem(
            value: userDataCubit.infoModel!.infoCountry!.cities![index].id!,
            child: Styles.text(userDataCubit.infoModel!.infoCountry!.cities![index].name??''),
          );
        }),
        onChanged: (x) async{
          await deliveryCubit.getCost(cityId: x!.toString(),resId: cartCubit.orderModel.restId!);
          checkOutCubit.cityId=x!.toInt();
        });
  }
}
