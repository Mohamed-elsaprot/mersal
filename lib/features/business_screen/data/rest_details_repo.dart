import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mersal/core/errors/failure.dart';
import 'package:mersal/core/services/api_service.dart';

import '../model/RestDetailsModel.dart';

class RestDetailsRepo {
  Future<Either<Failure,RestDetailsModel>> getRestDetails({required String restId})async{
    try {
      RestDetailsModel model;
      var res = await ApiService.getData(endPoint: ApiService.restDetails+restId);
      model = RestDetailsModel.fromJson(res['data']);
      return right(model);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'.tr()));
      }
    }
  }
}