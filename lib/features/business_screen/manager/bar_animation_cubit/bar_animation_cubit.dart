import 'package:flutter_bloc/flutter_bloc.dart';

import 'bar_animation_state.dart';

class BarAnimationCubit extends Cubit<BarAnimationState> {
  BarAnimationCubit() : super(BarAnimationInitial());
  bool vis = true;

}
