import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mersal/core/services/api_service.dart';
import 'package:mersal/features/home/models/HomeRestaurant.dart';

import '../../../core/errors/failure.dart';
import '../models/AppBanner.dart';

class GetHomeResRepo {
  Future<Either<Failure,List<HomeRestaurant>>> getHomeRes()async{
    try {
      List<HomeRestaurant> list = [];
      var res = await ApiService.getData(endPoint: ApiService.restaurants);
      res['data'].forEach((x)=> list.add(HomeRestaurant.fromJson(x)));
      return right(list);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'.tr()));
      }
    }
  }

  Future<Either<Failure,List<AppBanner>>> getAppBanner()async{
    try {
      List<AppBanner> list = [];
      var res = await ApiService.getData(endPoint: ApiService.appBanners);
      res['data'].forEach((x)=> list.add(AppBanner.fromJson(x)));
      return right(list);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'.tr()));
      }
    }
  }

  static Future setNewCountry({required String countryId})async{
      var res = await ApiService.putData(endPoint: ApiService.country+countryId);
  }
}