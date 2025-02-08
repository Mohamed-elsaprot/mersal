import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/features/requirments/manager/requirements_cubit.dart';
import 'package:mersal/features/requirments/manager/requirements_state.dart';
import 'package:mersal/features/requirments/view/choose_loc/view/choose_loc.dart';
import 'package:mersal/features/requirments/view/choose_locale_screen/view/choose_locale_screen.dart';

class Requirements extends StatefulWidget {
  const Requirements({super.key});

  @override
  State<Requirements> createState() => _RequirementsState();
}

class _RequirementsState extends State<Requirements> {
  late RequirementsCubit reqCubit;
  @override
  void initState() {
    reqCubit = BlocProvider.of<RequirementsCubit>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequirementsCubit,RequirementsState>(
      builder:(context,state)=> Scaffold(
        backgroundColor: Styles.primary,
        body: reqCubit.page == 0
            ? const LocaleScreen().animate().slideX(duration: const Duration(milliseconds: 500)) :
        const LocationScreen().animate().slideX(duration: const Duration(milliseconds: 300)),
      ),
    );
  }
}
