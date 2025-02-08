import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/business_screen/data/rest_details_repo.dart';
import 'package:mersal/features/business_screen/manager/rest_details_cubit/rest_details_state.dart';

import '../../model/RestDetailsModel.dart';


class RestDetailsCubit extends Cubit<RestDetailsState> {
  RestDetailsCubit(this.repo) : super(RestDetailsInitial());
  final RestDetailsRepo repo;

  RestDetailsModel? restDetailsModel;

  getRestDetails({required String restId})async{
    emit(RestDetailsLoading());
    var res = await repo.getRestDetails(restId: restId);
    res.fold((failure)=> emit(RestDetailsFailure(failure.errorMessage)),
        (model){
          restDetailsModel = model;
          emit(RestDetailsSuccess());
        }
    );
  }
}
