
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/my_orders/manager/timer_cubit/timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  int min=0,sec=59;

  calcTimerVal(){
    if(min>0){
      if(sec==1){
        sec=59; min--;
      }else {
        sec--;
      }
    }else{
      sec--;
    }
    emit(TimerInitial());
  }
}
