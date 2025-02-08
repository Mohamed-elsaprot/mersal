import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mersal/core/local_storage/model/OrderModel.dart';

import '../../../core/errors/failure.dart';
import '../../../core/services/api_service.dart';

class CheckOutRepo {
  Future<Either<Failure,dynamic>> createOrder({required OrderModel order,required String resId})async{
    try {
      ApiService.addToHeader('REST-UUID', resId);
      var res = await ApiService.postData(endPoint: ApiService.orders, postedData: order.toJson());
      ApiService.removeFromHeader('REST-UUID');
      return right(res);
    } catch (e) {
      // if (e is DioException) {
      //   return left(ServerFailure.fromDioError(e));
      // } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'.tr()));
      // }
    }
  }

  Future<Either<Failure,Map>> cityCostDelivery({required String cityId,required String resId})async{
    try {
      ApiService.addToHeader('REST-UUID', resId);
      var res = await ApiService.getData(endPoint: ApiService.city+cityId);
      ApiService.removeFromHeader('REST-UUID');
      return right(res['data']);
    } catch (e) {
      // if (e is DioException) {
      //   return left(ServerFailure.fromDioError(e));
      // } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'.tr()));
      // }
    }
  }

  Future<Either<Failure,Map>> coupon({required String resId,required String coupon})async{
    try {
      ApiService.addToHeader('REST-UUID', resId);
      var res = await ApiService.getData(endPoint: ApiService.coupon+coupon);
      ApiService.removeFromHeader('REST-UUID');
      return right(res['data']);
    } catch (e) {
      // if (e is DioException) {
      //   return left(ServerFailure.fromDioError(e));
      // } else {
        // print(e);
        // if(res['Message']=='coupon cannot be found.')

        return left(ServerFailure('يوجد خطأ بالكوبون!'.tr()));
      // }
    }
  }
}