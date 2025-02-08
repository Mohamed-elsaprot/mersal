import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:mersal/core/general_widgets/modal_material_with_page.dart';
import 'package:mersal/features/business_screen/view/business_screen.dart';
import 'package:mersal/features/navigation_screen/view/navigation_screen.dart';
import 'package:mersal/features/requirments/manager/requirements_cubit.dart';
import 'package:mersal/features/requirments/view/requirments.dart';
import 'package:mersal/features/splash/view/splash.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


abstract class AppRouter {
  static  String req = '/req';
  static  String navigationScreen = '/navigationScreen';
  static const String business = '/business';
  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Splash();
      },
    ),
    GoRoute(
      path: req,
      builder: (BuildContext context, GoRouterState state) {
        return const Requirements();
      },
    ),
    GoRoute(
      path: navigationScreen,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return  const ModalWithMaterialPage(child: NavigationScreen());
      },
      //NavigationScreen()
    ),
    GoRoute(
      path: business,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return ModalWithMaterialPage(child: BusinessScreen(restId: state.extra as String,));
      },
    ),
  ]);
}
