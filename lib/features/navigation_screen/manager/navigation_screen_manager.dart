import 'package:flutter_bloc/flutter_bloc.dart';


class NavigationScreenCubit extends Cubit<NavigationScreenState> {
  NavigationScreenCubit():super(NavigationScreenState());
  int index = 0;

  setIndex(int x){
    index = x;
    emit(NavigationScreenState());
  }
  resetNavScreen({required int x}){
    index=x;
    emit(NavigationScreenReset());
  }
}

class NavigationScreenState{}
class NavigationScreenReset extends NavigationScreenState{}