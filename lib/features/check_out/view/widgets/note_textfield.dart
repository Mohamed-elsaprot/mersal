import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/cart/manager/cart_cubit.dart';

import '../../../../consts.dart';
import '../../../../core/design/app_styles.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({super.key, required this.controller, required this.scrollController});
  final TextEditingController controller;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    var cartCubit =BlocProvider.of<CartCubit>(context);

    return TextFormField(
      onTap: (){
        Future.delayed(const Duration(milliseconds: 150),(){
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        });
      },
      controller: controller,
      onChanged: (x)=> cartCubit.orderModel.note=x,
      cursorColor: Styles.primary,
      style: const TextStyle(fontFamily: fontFamily,fontWeight: FontWeight.w700),
      decoration: InputDecoration(
        hintText: 'ملاحظة على الطلب'.tr(),
        prefixIcon: const Icon(Icons.message_outlined,color: Colors.grey,),
        filled: true,fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
