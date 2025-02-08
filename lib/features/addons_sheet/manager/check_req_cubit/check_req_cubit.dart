import 'package:flutter_bloc/flutter_bloc.dart';

import 'check_req_state.dart';

class CheckReqCubit extends Cubit<CheckReqState> {
  CheckReqCubit() : super(CheckReqInitial());
}
