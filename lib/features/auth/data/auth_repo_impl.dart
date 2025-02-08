import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../core/errors/failure.dart';
import '../../../core/services/api_service.dart';

class AuthRepoImpl {

  Future<Either<Failure, Map>> auth({required Map data,required String endPoint}) async{
    try {
      var res = await ApiService.postData(endPoint: endPoint, postedData: data);
      return right(res);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'.tr()));
      }
    }
  }

}