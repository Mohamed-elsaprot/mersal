import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bar_animation_state.dart';

class AppBarAnimationCubit extends Cubit<AppBarAnimationState> {
  AppBarAnimationCubit() : super(AppBarAnimationInitial());
  bool vis = true;

}
