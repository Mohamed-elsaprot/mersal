import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/core/local_storage/secure_storage.dart';
import 'package:mersal/features/auth/data/auth_repo_impl.dart';
import 'package:mersal/features/auth/manager/auth_cubit.dart';
import 'package:mersal/features/cart/manager/cart_cubit.dart';
import 'package:mersal/features/home/data/get_home_res_repo.dart';
import 'package:mersal/features/home/manager/home_cubit/home_cubit.dart';
import 'package:mersal/features/navigation_screen/manager/navigation_screen_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mersal/features/success_screen/view/success_screen.dart';

import 'core/router.dart';
import 'core/local_storage/hive_services.dart';
import 'features/requirments/manager/requirements_cubit.dart';
import 'features/splash/data/get_user_data_repo.dart';
import 'features/splash/manager/user_data_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await SecureStorage.deleteToken();
  await Hive.initFlutter();
  await SecureStorage.initSecureStorage();
  await openHiveBoxes();
  runApp(
      EasyLocalization(
        startLocale: const Locale('ar'),
        supportedLocales: const [
          Locale('ar'),
          Locale('he'),
        ],
        path: 'locales',
        child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.4, 866.3),
      builder: (_,child) {
        // return MaterialApp(home: SuccessScreen(),);
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=>UserDataCubit(GetUserDataRepo(),)..getReqData()),
            BlocProvider(create: (context)=>RequirementsCubit()),
            BlocProvider(create: (context)=> AuthCubit(AuthRepoImpl())),
            BlocProvider(create: (context)=> NavigationScreenCubit()),
            BlocProvider(create: (context)=> HomeCubit(GetHomeResRepo())..getAppBanner()..getHomeRestaurants()),
            BlocProvider(create: (context)=> CartCubit()..getCachedOrder()),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: AppRouter.router,
            theme: ThemeData(
                scaffoldBackgroundColor: Styles.scaffoldWhiteColor
            ),
          ),
        );
      },
    );
  }
}
