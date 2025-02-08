

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/addons_sheet/manager/title_animation/title_animaion_state.dart';

class TitleAnimationCubit extends Cubit<TitleAnimaionState> {
  TitleAnimationCubit() : super(TitleAnimaionInitial());
}
