import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/addons_sheet/manager/addons_manager/addons_cubit.dart';
import 'package:mersal/features/addons_sheet/manager/check_req_cubit/check_req_cubit.dart';
import 'package:mersal/features/addons_sheet/manager/title_animation/title_animaion_cubit.dart';
import 'package:mersal/features/addons_sheet/view/widgets/addons_sheet_body.dart';
import 'package:mersal/features/business_screen/model/Product.dart';


class AddonsSheet extends StatelessWidget {
  const AddonsSheet({super.key, required this.product,});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=> AddonsCubit()),
      BlocProvider(create: (context)=> CheckReqCubit()),
      BlocProvider(create: (context)=> TitleAnimationCubit()),
    ], child: AddonsSheetBody(product: product,));
  }
}

