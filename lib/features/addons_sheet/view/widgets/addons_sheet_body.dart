import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/features/addons_sheet/manager/addons_manager/addons_cubit.dart';
import 'package:mersal/features/addons_sheet/manager/title_animation/title_animaion_cubit.dart';
import 'package:mersal/features/addons_sheet/manager/title_animation/title_animaion_state.dart';
import 'package:mersal/features/addons_sheet/view/widgets/add_to_cat_button.dart';
import 'package:mersal/features/addons_sheet/view/widgets/extras_column.dart';
import 'package:mersal/features/addons_sheet/view/widgets/comp_column.dart';
import 'package:mersal/features/addons_sheet/view/widgets/counter_button.dart';
import 'package:mersal/features/addons_sheet/view/widgets/meal_title_row.dart';
import 'package:mersal/features/addons_sheet/view/widgets/sized_column.dart';
import 'package:mersal/features/business_screen/view/widgets/close_button.dart';

import '../../../../core/design/fun_widgets.dart';
import '../../../business_screen/model/Product.dart';
import '../../manager/extra_animation_cubit/extra_count_limit_cubit.dart';

class AddonsSheetBody extends StatefulWidget {
  const AddonsSheetBody({super.key, required this.product});
  final Product product;

  @override
  State<AddonsSheetBody> createState() => _AddonsSheetBodyState();
}

class _AddonsSheetBodyState extends State<AddonsSheetBody> {
  late AddonsCubit addonsCubit;
  late ScrollController controller;
  Color titleColor = Colors.transparent;
  late TitleAnimationCubit titleCubit;
  int optionLen=0;
  int titlesLen=0;
  @override
  void initState() {
    controller = ScrollController();
    titleCubit = BlocProvider.of<TitleAnimationCubit>(context);
    controller.addListener((){
      titleColor= controller.position.pixels<MediaQuery.of(context).size.height/7? Colors.transparent:Colors.black;
      titleCubit.emit(TitleAnimaionInitial());
    });
    addonsCubit =BlocProvider.of<AddonsCubit>(context);
    addonsCubit.generateExtrasList(widget.product);
    addonsCubit.generateCompList(widget.product);
    addonsCubit.generateAndResetReqIndexGroup(widget.product);
    addonsCubit.setStartedSize(widget.product);
    titlesLen = widget.product.comprehensiveExtras!.isNotEmpty? 1:0;
    Map map = addonsCubit.calcSheetLen(optionLen: optionLen, titlesLen: titlesLen, product: widget.product);
    optionLen=map[0]; titlesLen=map[1];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 420.h+((optionLen+titlesLen)*50).h,
          child: Scaffold(
            body: CustomScrollView(
              controller: controller,
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  scrolledUnderElevation: 0,
                  elevation: 0,
                  toolbarHeight: 80.h,
                  expandedHeight: 220.h,
                  backgroundColor: Colors.white,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: BlocBuilder<TitleAnimationCubit,TitleAnimaionState>(builder: (context,state)=>Styles.text(widget.product.name??'',color: titleColor,size: 25)),
                    background: cachedImage(widget.product.images![0].image??'', height: 250.h,boxFit: BoxFit.cover),
                  ),
                ),
                SliverToBoxAdapter(child: MealTitleRow(product: widget.product,),),
                SliverList(
                    delegate: SliverChildListDelegate(
                    [
                      if(widget.product.sizes!.length>1)
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20.w),
                          child:
                          SizeColumn(sizesList: widget.product.sizes!) ,
                        ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20.w),
                        child:
                        CompColumn(compExtraList: widget.product.comprehensiveExtras!,) ,
                      ),
                      ...List.generate(widget.product.groups!.length, (x)=> Padding(
                        padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20.w),
                        child:
                        BlocProvider(create: (context)=> ExtraCountLimitCubit(),
                          child: ExtrasCheckBoxColumn(group: widget.product.groups![x], groupIndex: x,),) ,
                      ),),
                      SizedBox(height: 100.h,)
                    ]
                ))
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              height: 55.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              margin: EdgeInsets.only(bottom: 20.h),
              child: Row(
                children: [
                  const Expanded(
                    flex: 14,
                    child: CounterButton(),
                  ),
                  const Expanded(flex: 1,child: SizedBox(),),
                  Expanded(
                    flex: 26,
                    child: AddToCatButton(product: widget.product,),
                  )
                ],
              ),
            ),
          ),
        ),
        const CustomCloseButton()
      ],
    );
  }
}