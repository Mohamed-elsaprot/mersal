import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mersal/features/my_orders/view/widgets/ordersData.dart';

import '../../../core/errors/failure.dart';
import '../../../core/services/api_service.dart';

class MyOrdersRepo {
  Future<Either<Failure,OrdersData>> getOrders({required String endPoint})async{
    try {
      OrdersData ordersData;
      var res = await ApiService.getData(endPoint: endPoint);
      ordersData = OrdersData.fromJson(res['data']);
      return right(ordersData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'.tr()));
      }
    }
  }

  Future<Either<Failure,OrdersData>> getNextOrders({required String link,})async{
    try {
      OrdersData ordersData;
      var res = await ApiService.getNextLink(link: link);
      ordersData = OrdersData.fromJson(res['data']);
      return right(ordersData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'.tr()));
      }
    }
  }

  // Future<Either<Failure,DateTime>> getCorrectTime()async{
  //   try {
  //     var res = await ApiService.getData(link: 'https://worldtimeapi.org/api/timezone/Asia/Jerusalem');
  //     DateTime dateTime = DateTime.tryParse(res['datetime'].split('+')[0])!;
  //     return right(dateTime);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioError(e));
  //     } else {
  //       return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'.tr()));
  //     }
  //   }
  // }
}