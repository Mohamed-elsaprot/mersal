import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/consts.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/features/navigation_screen/view/widget/nav_bar.dart';

import '../manager/navigation_screen_manager.dart';


class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var navCubit= BlocProvider.of<NavigationScreenCubit>(context);
    return BlocBuilder<NavigationScreenCubit,NavigationScreenState>(builder: (context,state){
      return Scaffold(
        backgroundColor: Styles.scaffoldColor,
        body: screensList[navCubit.index],
        bottomNavigationBar: const NavBar(),
      );
    });
  }
}