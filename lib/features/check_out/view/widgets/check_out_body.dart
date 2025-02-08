import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mersal/core/design/appTexts.dart';
import 'package:mersal/core/design/app_styles.dart';
import 'package:mersal/core/design/fun_widgets.dart';
import 'package:mersal/core/general_widgets/custom_button.dart';
import 'package:mersal/core/router.dart';
import 'package:mersal/features/auth/view/phone/widgets/phone_text_field.dart';
import 'package:mersal/features/cart/manager/cart_cubit.dart';
import 'package:mersal/features/check_out/manager/check_out_cubit.dart';
import 'package:mersal/features/check_out/manager/check_out_state.dart';
import 'package:mersal/features/check_out/view/widgets/cost_container.dart';
import 'package:mersal/features/check_out/view/widgets/coupon_text_field.dart';
import 'package:mersal/features/check_out/view/widgets/delivery_method_button.dart';
import 'package:mersal/features/check_out/view/widgets/loc_details_textfield.dart';
import 'package:mersal/features/check_out/view/widgets/location_drop_down.dart';
import 'package:mersal/features/check_out/view/widgets/note_textfield.dart';
import 'package:mersal/features/check_out/view/widgets/payment_method_button.dart';
import 'package:mersal/features/success_screen/view/success_screen.dart';

import '../../manager/coupon_cubit/coupon_cubit.dart';
import '../../manager/delivery_cubit/delivery_cost_cubit.dart';

class CheckOutBody extends StatefulWidget {
  const CheckOutBody({super.key});

  @override
  State<CheckOutBody> createState() => _CheckOutBodyState();
}

class _CheckOutBodyState extends State<CheckOutBody> {
  late CartCubit cartCubit;
  late CheckOutCubit checkOutCubit;
  late DeliveryCostCubit deliveryCubit;
  late CouponCubit couponCubit;
  late ScrollController controller;
  late GlobalKey<FormState> formKey;
  late TextEditingController noteController;
  @override
  void initState() {
    controller = ScrollController();
    noteController = TextEditingController();
    cartCubit = BlocProvider.of<CartCubit>(context);
    checkOutCubit = BlocProvider.of<CheckOutCubit>(context);
    deliveryCubit = BlocProvider.of<DeliveryCostCubit>(context);
    couponCubit = BlocProvider.of<CouponCubit>(context);
    formKey = GlobalKey<FormState>();
    noteController.text=cartCubit.orderModel.note??'';
    cartCubit.orderModel.address=null; cartCubit.orderModel.coupon=null;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sheetApBar(title: 'اكمال عملية الدفع'.tr(),),
      body: SingleChildScrollView(
        controller: controller,
        padding: EdgeInsets.symmetric(horizontal: 45.w),
        child: SizedBox(
          width: double.infinity,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h,),
                const DeliveryMethodButton(),
                SizedBox(height: 25.h,),
                BlocBuilder<CheckOutCubit,CheckOutState>(builder: (context,state){
                  return checkOutCubit.deliveryMethod==0?Column(
                    children: [
                      const LocationDropDown(),
                      SizedBox(height: 25.h,),
                      const LocDetailsTextField(),
                    ],
                  ):Styles.text('سوف يتم استلام الطلب ذاتيا');
                }),
                SizedBox(height: 25.h,),
                const PaymentMethodButton(),
                SizedBox(height: 20.h,),
                BlocBuilder<CheckOutCubit,CheckOutState>(
                    buildWhen: (context,state)=> state is ChangeCashQuote ,
                    builder: (context,state){
                      return checkOutCubit.paymentMethod==0?
                      SizedBox(width: 140.w,
                        child: Styles.text('الدفع كاش للمرسل عن الاستلام!'.tr(),size: 18,fontWeight: FontWeight.w700,textAlign: TextAlign.center),
                      ) :const SizedBox();
                }),
                SizedBox(height: 25.h,),
                NoteTextField(controller: noteController,scrollController: controller,),
                SizedBox(height: 25.h,),
                CouponTextField(scrollController: controller,),
                SizedBox(height: 25.h,),
                const CostContainer(),
                SizedBox(height: 150.h,)
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:BlocConsumer<CheckOutCubit,CheckOutState>(
          builder: (context,state){
            if(state is CheckOutLoading){
              return Container(
                  height: 55.h,width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 12.w,),
                  margin: EdgeInsets.only(bottom: 12.h),
                  child: CustomButton(
                    fun: (){}, title:'',
                    titleWidget: Lottie.asset('assets/animation/loading.json',),
                    backGroundColor: Styles.primaryShad,)
              );
            }
            return Padding(
              padding: const EdgeInsets.all(12),
              child: CustomButton(
                fun: (){
                  if(formKey.currentState!.validate()){
                    checkOutCubit.createOrder(order: cartCubit.orderModel,restId: cartCubit.orderModel.restId!);
                  }
                }, title: '',rad: 6,
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 12.h),
                titleWidget:Row(
                  children: [
                    Styles.text('ارسال الطلب'.tr(),size: 20,color: Colors.white),
                    const Spacer(),
                    Styles.text('${cartCubit.cartTotal+deliveryCubit.deliveryCost-couponCubit.couponDiscount} ${Texts.currency}',size: 18,color: Colors.white),
                  ],
                ),
              ),
            );
        },
          listener: (context,state)async{
        if(state is CheckOutFailure) customDialog(context: context, message: state.errorMessage);
        if(state is CheckOutSuccess) {
          await cartCubit.resetOrder();
          Future.delayed(const Duration(milliseconds: 50),(){
            AppRouter.router.pop();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SuccessScreen()));
          });
        }
      }),
    );
  }
}
