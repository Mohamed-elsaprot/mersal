import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/auth/manager/auth_cubit.dart';
import 'package:mersal/features/auth/manager/auth_state.dart';
import 'package:mersal/features/settings/data/settings_repo.dart';
import 'package:mersal/features/settings/manager/settings_cubit.dart';
import 'package:mersal/features/settings/view/widgets/settings_body.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>SettingsCubit(SettingsRepo())..getSettings(),
      child: BlocBuilder<AuthCubit,AuthState>(builder: (context,auth){
        return const SettingsBody();
      }),);
  }
}
