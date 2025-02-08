import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mersal/features/settings/model/ContentPage.dart';

import '../../../core/errors/failure.dart';
import '../../../core/services/api_service.dart';

class SettingsRepo {
  Future<Either<Failure,List<ContentPage>>> getPages()async{
    try {
      List<ContentPage> list = [];
      var res = await ApiService.getData(endPoint: ApiService.settings);
      res['data'].forEach((x){
        list.add(ContentPage.fromJson(x));
      });
      return right(list);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'.tr()));
      }
    }
  }
}