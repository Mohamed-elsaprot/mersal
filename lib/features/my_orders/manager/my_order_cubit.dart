import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/core/local_storage/secure_storage.dart';
import 'package:mersal/features/my_orders/data/my_orders_repo.dart';
import 'package:mersal/features/my_orders/model/Links.dart';

import '../../../core/services/api_service.dart';
import '../model/MyOrder.dart';
import 'my_order_state.dart';

class MyOrderCubit extends Cubit<MyOrderState> {
  MyOrderCubit(this.repo) : super(MyOrderInitial());
  final MyOrdersRepo repo;
  
  List<MyOrder> available=[];
  List<MyOrder> closed=[];
  Links? links;
  int page =0;
  bool last =false;
  // late DateTime correctTime;

  // getCorrectTime()async{
  //   emit(TimeLoading());
  //   var res = await repo.getCorrectTime();
  //   res.fold((failure)=>emit(MyOrderFailure(errorMessage: failure.errorMessage)), (date){
  //     correctTime = date;
  //     emit(TimeSuccess());
  //   });
  // }
  getAvailable()async{
    if(SecureStorage.token!=null){
      links=null;last = false;
      emit(MyOrderLoading());
      var res = await repo.getOrders(endPoint: ApiService.availableOrders);
      res.fold((failure) {
        emit(MyOrderFailure(errorMessage: failure.errorMessage));
      },
              (ordersData){
            available = ordersData.ordersList!;
            emit(MyOrderSuccess());
          }
      );
    }else {
      emit(MyOrderSuccess());
    }
  }

  getClosed() async {
    if(SecureStorage.token!=null) {
      links = null;
      last = false;
      emit(MyOrderLoading());
      var res = await repo.getOrders(endPoint: ApiService.closedOrders);
      res.fold((failure) {
        emit(MyOrderFailure(errorMessage: failure.errorMessage));
      }, (ordersData) {
        closed = ordersData.ordersList!;
        links = ordersData.links;
        emit(MyOrderSuccess());
      });
    }else {
      emit(MyOrderSuccess());
    }
  }

  getClosedNext() async {
    if(links!.next != null){
      var res = await repo.getNextOrders(link: '${links!.next!}&perPage=10',);
      res.fold((failure)=>print(failure.errorMessage),
          (orderData){
          closed.addAll(orderData.ordersList!);
            links = orderData.links;
          }
      );
    }else{
      last = true;
    }
    emit(MyOrderSuccess());
  }

  // int calcMin(DateTime date){
  //   int x = date.difference(correctTime).inMinutes;
  //   x>=1? x--:null;
  //   return x;
  // }

}
