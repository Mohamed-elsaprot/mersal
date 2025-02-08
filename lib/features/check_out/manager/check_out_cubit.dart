
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/core/local_storage/model/OrderModel.dart';
import 'package:mersal/features/check_out/data/check_out_repo.dart';

import 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit(this.checkOutRepo) : super(CheckOutInitial());
  final CheckOutRepo checkOutRepo;

  int deliveryMethod=0,paymentMethod=0,cityId=-1;
  String address= '';
  num delivery = 0,couponDiscount=0;

  createOrder({required OrderModel order,required String restId})async{
    emit(CheckOutLoading());
    setOrderData(order);
    var res = await checkOutRepo.createOrder(order: order,resId: restId);
    res.fold((failure)=>emit(CheckOutFailure(errorMessage: failure.errorMessage)), (suc)=>emit(CheckOutSuccess()));
  }

  setOrderData(OrderModel order){
    order.paymentMethod= paymentMethod;
    order.deliveryMethod= deliveryMethod;
    order.cityId= cityId;
    order.address= address;
  }

  getDeliveryCost()async{

  }

}
