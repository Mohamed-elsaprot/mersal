import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/requirments/manager/requirements_state.dart';

class RequirementsCubit extends Cubit<RequirementsState> {
  RequirementsCubit() : super(RequirementsInitial());
  int page=0;

  changePage(int x){
    page = x;
    emit(RequirementsInitial());
  }
}
