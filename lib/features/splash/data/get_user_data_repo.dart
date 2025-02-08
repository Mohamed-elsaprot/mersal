import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mersal/core/errors/failure.dart';
import 'package:mersal/core/local_storage/secure_storage.dart';
import 'package:mersal/core/models/Country.dart';
import 'package:mersal/core/models/Info.dart';
import 'package:mersal/core/models/Language.dart';

import '../../../core/services/api_service.dart';

class GetUserDataRepo{
  Future<Either<Failure,Map>> getUserData()async{
    try {
      List<Language> lang=[];
      List<Country> countries=[];
      InfoModel? infoModel;
      var res = await ApiService.getData(endPoint: ApiService.requirements);
      res['data']['languages'].forEach((x)=>lang.add(Language.fromJson(x)));
      res['data']['countries'].forEach((x)=>countries.add(Country.fromJson(x)));
      if(res['data']['info']!=null) infoModel = InfoModel.fromJson(res['data']['info']);
      return right({
        0:lang, 1:countries,2:infoModel
      });
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'.tr()));
      }
    }
  }
}