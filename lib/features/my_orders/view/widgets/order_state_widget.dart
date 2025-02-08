import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mersal/features/my_orders/manager/timer_cubit/timer_cubit.dart';
import 'package:mersal/features/my_orders/manager/timer_cubit/timer_state.dart';
import 'package:mersal/features/my_orders/model/Timer.dart';

import '../../../../core/design/app_styles.dart';
import '../../manager/my_order_cubit.dart';

class OrderStateWidget extends StatefulWidget {
  const OrderStateWidget({super.key, required this.stateId, this.timer});
  final int stateId;
  final OrderTimer? timer;
  @override
  State<OrderStateWidget> createState() => _OrderStateWidgetState();
}

class _OrderStateWidgetState extends State<OrderStateWidget> with AutomaticKeepAliveClientMixin {
  late final int x,y;
  late BorderRadiusGeometry xBorder,yBorder;
  late AlignmentGeometry align;
  Timer? timer;
  late MyOrderCubit ordersCubit;
  late TimerCubit timerCubit;
  @override
  void initState() {
    ordersCubit = BlocProvider.of<MyOrderCubit>(context);
    timerCubit = BlocProvider.of<TimerCubit>(context);
    align= widget.stateId==1||widget.stateId==2||widget.stateId==3? AlignmentDirectional.center:
    widget.stateId==0? AlignmentDirectional.centerStart:AlignmentDirectional.centerEnd;
    List list = checkState(widget.stateId);
    x=list[0]; y=list[1];
    xBorder= list[2]; yBorder=list[3];
    if(widget.timer!=null){
      timerCubit.min=widget.timer!.minutes??1;
      timerCubit.min-1;
      timerCubit.sec=widget.timer!.seconds??0;
    }
    if(widget.stateId==1){
      timer = Timer.periodic(const Duration(seconds: 1), (t) {
        timerCubit.min == 0 && timerCubit.sec == 0 ? timer!.cancel() : timerCubit.calcTimerVal();
      });
    }
    super.initState();
  }
  @override
  void dispose() {
    if(widget.stateId==1)timer!.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit,TimerState>(builder: (context,state){
      return SizedBox(
        height: 40.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                      flex: x,
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: xBorder,
                            gradient: const LinearGradient(
                                begin: AlignmentDirectional.centerStart,
                                end: AlignmentDirectional.centerEnd,
                                colors: [
                                  Color(0xff59baff),
                                  Styles.primaryButtons
                                ]
                            )
                        ),alignment: Alignment.center,
                        padding: widget.stateId==1?EdgeInsetsDirectional.only(end: 10.w):null,
                        child: widget.stateId==1?Styles.text('${timerCubit.sec} : ${timerCubit.min}',size: 13,fontWeight: FontWeight.w900):null,
                      )),
                  Expanded(
                      flex: y,
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: yBorder,
                            color: Colors.grey.shade100
                        ),
                      )),
                ],
              ),
            ),
            Row(
                children: List.generate(5, (index){
                  return widget.stateId == index?
                  Expanded(child: Align(alignment: align,child: const CircleAvatar(backgroundColor: Styles.primaryButtons,radius: 20,))):
                  const Expanded(child: SizedBox());
                })
            )
          ],
        ),
      );
    });
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => widget.stateId==1?true:false;

  List checkState(int id){
    List list=[];
    BorderRadiusGeometry xBorder = BorderRadius.circular(100);
    BorderRadiusGeometry yBorder = BorderRadius.circular(100);
    switch(id){
      case 0 : list = [0,2];break;
      case 1 : list = [1,2]; xBorder=const BorderRadiusDirectional.horizontal(start: Radius.circular(100));
      yBorder =  const BorderRadiusDirectional.horizontal(end: Radius.circular(100));break;
      case 2 : list = [2,2];xBorder=const BorderRadiusDirectional.horizontal(start: Radius.circular(100));
      yBorder =  const BorderRadiusDirectional.horizontal(end: Radius.circular(100));break;
      case 3 : list = [2,1];xBorder=const BorderRadiusDirectional.horizontal(start: Radius.circular(100));
      yBorder =  const BorderRadiusDirectional.horizontal(end: Radius.circular(100));break;
      case 4 : list = [2,0,xBorder,yBorder];break;
    }
    list.addAll([xBorder,yBorder]);
    return list;
  }


}
