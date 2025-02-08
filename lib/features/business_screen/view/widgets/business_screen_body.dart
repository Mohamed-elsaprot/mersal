import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/core/design/fun_widgets.dart';
import 'package:mersal/features/business_screen/manager/bar_animation_cubit/bar_animation_cubit.dart';
import 'package:mersal/features/business_screen/manager/bar_animation_cubit/bar_animation_state.dart';
import 'package:mersal/features/business_screen/model/sub_category.dart';
import 'package:mersal/features/business_screen/view/widgets/circles_row.dart';
import 'package:mersal/features/business_screen/view/widgets/close_button.dart';
import 'package:mersal/features/business_screen/view/widgets/contacts_row.dart';
import 'package:mersal/features/business_screen/view/widgets/meal_card.dart';
import 'package:mersal/features/business_screen/view/widgets/restaurant_title.dart';

import '../../../../core/general_widgets/go_cart_button.dart';
import '../../manager/rest_details_cubit/rest_details_cubit.dart';

class BusinessScreenBody extends StatefulWidget {
  const BusinessScreenBody({super.key});

  @override
  State<BusinessScreenBody> createState() => _BusinessScreenBodyState();
}

class _BusinessScreenBodyState extends State<BusinessScreenBody> {
  late ScrollController controller;
  late RestDetailsCubit restCubit;
  late BarAnimationCubit barCubit;
  Color barColor = Colors.transparent;
  @override
  void initState() {
    barCubit = BlocProvider.of<BarAnimationCubit>(context);
    restCubit = BlocProvider.of<RestDetailsCubit>(context);
    controller = ScrollController();
    controller.addListener((){
      barColor= controller.position.pixels>=150? Colors.white:Colors.transparent;
      barCubit.emit(BarAnimationInitial());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            controller: controller,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
                elevation: 0,
                toolbarHeight: 120.h,
                floating: true,
                pinned: true,
                expandedHeight: 230.h,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      BlocBuilder<BarAnimationCubit,BarAnimationState>(builder: (context,state)=>
                          Column(
                            children: [
                              Expanded(flex: 8,child: Container(color: barColor,)),
                              Expanded(flex: 2,child: Container(color: Colors.transparent,)),
                            ],
                          )),
                      CirclesRow(restaurant: restCubit.restDetailsModel!.restaurant!, topPadding: 0, imagesSize: 65.sp,),
                    ],
                  ),
                  background: restCubit.restDetailsModel!.restaurant!.banners!.isNotEmpty?Column(
                    children: [
                      cachedImage(restCubit.restDetailsModel!.restaurant!.banners![0].image ?? '', height: 200.h, boxFit: BoxFit.cover,),
                    ],
                  ):null,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    ContactsRow(restDetailsModel: restCubit.restDetailsModel!,),
                    SizedBox(height: 8.h,),
                    RestaurantTitle(restaurant: restCubit.restDetailsModel!.restaurant!),
                  ],
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: restCubit.restDetailsModel!.categories!.length,
                (context, i) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (restCubit.restDetailsModel!.categories![i].subCategories!.isEmpty)
                        Styles.text(restCubit.restDetailsModel!.categories![i].name ?? ' ', fontWeight: FontWeight.w600, size: 20),

                      if (restCubit.restDetailsModel!.categories![i].subCategories!.isEmpty)
                        const SizedBox(height: 10,),

                      if (restCubit.restDetailsModel!.categories![i].subCategories!.isEmpty)
                        ...List.generate(
                            restCubit.restDetailsModel!.categories![i].products!.length,
                            (index) => MealCard(product: restCubit.restDetailsModel!.categories![i].products![index],)
                        )
                      else
                        for (SubCategory x in restCubit.restDetailsModel!.categories![i].subCategories!)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Styles.text(x.name ?? '', fontWeight: FontWeight.w900, size: 25),
                              const SizedBox(height: 10,),
                              ...List.generate(x.products!.length, (index) => MealCard(product: x.products![index]))
                            ],
                          ),
                    ],
                  ),
                ),
              ))
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const GoCartButton(isHome: false,),
        ),
        const CustomCloseButton(),
      ],
    );
  }
}