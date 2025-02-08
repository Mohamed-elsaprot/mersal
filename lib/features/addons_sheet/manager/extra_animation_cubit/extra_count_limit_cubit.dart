import 'package:flutter_bloc/flutter_bloc.dart';

import 'extra_count_limit_state.dart';

class ExtraCountLimitCubit extends Cubit<ExtraCountLimitState> {
  ExtraCountLimitCubit() : super(ExtraCountLimitInitial());
  double target = 0;

  changeAnimationTarget(double x) {
    if(x==1 || x==2){
      target= target==0?1:0;
      emit(ExtraCountLimitInitial());
    }else{
      target=x;
    }
  }
}
