import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/check_out/data/check_out_repo.dart';

import 'delivery_cost_state.dart';

class DeliveryCostCubit extends Cubit<DeliveryCostState> {
  DeliveryCostCubit(this.checkOutRepo) : super(DeliveryCostInitial());
  final CheckOutRepo checkOutRepo;
  num deliveryCost=0 , minCart=0;

  getCost({required String cityId,required String resId})async{
    emit(DeliveryCostLoading());
    var res = await checkOutRepo.cityCostDelivery(cityId: cityId,resId: resId);
    res.fold((failure)=>emit(DeliveryCostFailure(errorMessage: failure.errorMessage)), (map){
      deliveryCost = map['cost'];
      minCart = map['min_cart'];
      emit(DeliveryCostSuccess());
    });
  }
}
