import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/home/manager/app_bar_nimation_cubit/app_bar_animation_cubit.dart';
import 'package:mersal/features/home/view/widgets/home_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>AppBarAnimationCubit(),
      child: const HomeBody(),);
  }
}
