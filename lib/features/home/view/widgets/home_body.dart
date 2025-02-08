import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/core/design/fun_widgets.dart';
import 'package:mersal/core/general_widgets/go_cart_button.dart';
import 'package:mersal/features/home/manager/app_bar_nimation_cubit/app_bar_animation_cubit.dart';
import 'package:mersal/features/home/manager/app_bar_nimation_cubit/app_bar_animation_state.dart';
import 'package:mersal/features/home/view/widgets/ads_slider.dart';
import 'package:mersal/features/home/view/widgets/logo_and_location_row.dart';
import '../../../../core/design/appTexts.dart';
import '../../../../core/general_widgets/custom_button.dart';
import '../../../cart/manager/cart_cubit.dart';
import '../../../cart/manager/cart_state.dart';
import '../../manager/home_cubit/home_cubit.dart';
import '../../manager/home_cubit/home_state.dart';
import 'card_item.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late HomeCubit homeCubit;
  late AppBarAnimationCubit appBarCubit;
  late ScrollController scrollController;
  @override
  void initState() {
    homeCubit = BlocProvider.of<HomeCubit>(context);
    appBarCubit = BlocProvider.of<AppBarAnimationCubit>(context);
    scrollController = ScrollController();
    scrollController.addListener((){
      scrollController.position.pixels>160||
          scrollController.position.userScrollDirection == ScrollDirection.reverse ? appBarCubit.vis=false: appBarCubit.vis=true;
      appBarCubit.emit(AppBarAnimationInitial());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Styles.primary,
      onRefresh: ()async{
        await homeCubit.getAppBanner();
        await homeCubit.getHomeRestaurants();
      },
        child: Scaffold(
          body: Stack(
            children: [
              BlocConsumer<HomeCubit,HomeState>(
                  buildWhen: (context,state)=>
                  state is HomeSuccess|| state is HomeLoading|| state is HomeFailure,
                  listener: (context,state){
                    if(state is HomeFailure) customDialog(context: context, message: state.errorMessage);
                  },
                  builder: (context,state){
                    if(state is HomeSuccess && homeCubit.homeRestList.isNotEmpty){
                      return CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          SliverToBoxAdapter(
                            child:  PreferredSize(
                              preferredSize: Size(0, 200.h),
                              child: BlocBuilder<HomeCubit,HomeState>(
                                  buildWhen: (context,bannerState)=>bannerState is AppBannerSuccess|| bannerState is AppBannerFailure|| bannerState is AppBannerLoading,
                                  builder: (context,bannerState){
                                    if(homeCubit.appBannerList.isNotEmpty) {
                                      return const AdsSlider();
                                    }else{
                                      return shimmerWidget(height: 200.h, width: double.infinity);
                                    }
                                  }),
                            ),
                          ),
                          SliverToBoxAdapter(child: SizedBox(height: 12.h,),),
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                                childCount: homeCubit.homeRestList.length,
                                // childCount: 4,
                                    (context, index) => CardItem(homeRestaurant: homeCubit.homeRestList[index],),
                              )
                          ),
                        ],
                      );
                    }else{
                      return ListView(
                        controller: scrollController,
                        children: [
                          shimmerWidget(height: 200.h, width: double.infinity),
                          SizedBox(height: 20.h,),
                          ...List.generate(8, (index)=>shimmerWidget(height: 200.h, width: double.infinity,rad: 15,margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 15)))
                        ],
                      );
                    }
                  }),
              // ainmation
              BlocBuilder<AppBarAnimationCubit,AppBarAnimationState>(builder: (context,state) {
                return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    // height: 70.h,
                    color: appBarCubit.vis? Colors.transparent:Colors.white70,
                    padding: const EdgeInsets.only(bottom: 10),
                    child: LogoAndLocationRow(color:appBarCubit.vis?Colors.white: Colors.black ,)
                );
              },)
            ],
      ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const GoCartButton(isHome: true,),
    ),);
  }
}