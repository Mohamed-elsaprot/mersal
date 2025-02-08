import 'package:dio/dio.dart';
import 'package:mersal/core/local_storage/secure_storage.dart';

class ApiService {
  static const baseUrl = 'https://app.mersal.cc/api/v1/customer/';
  static const logIn = 'login';
  static const signUp = 'signup';
  static const checkOtp = 'check/';
  static const requirements = 'requirements';
  static const restaurants = 'restaurants';
  static const appBanners = 'appBanners';
  static const restDetails = 'restaurants/';
  static const orders = 'orders';
  static const city = 'orders/city/';
  static const coupon = 'orders/coupon/';
  static const availableOrders = 'orders/available';
  static const closedOrders = 'orders/closed?page=1&perPage=10';
  static const country = 'country/';
  static const settings = 'introdactionPages';

  static updateHeader(){
    _dio.options.headers.addAll({'Country-ID':SecureStorage.countryId,'Locale':SecureStorage.lang,
      'Authorization':SecureStorage.token!=null?'Bearer ${SecureStorage.token}':null});
  }

  static addToHeader(String key,String? val){
  _dio.options.headers[key]=val;
  print(_dio.options.headers);
  }
  static removeFromHeader(String key){
  _dio.options.headers.remove(key);
  print(_dio.options.headers);
  }

  static final Dio _dio = Dio(
    BaseOptions(
        headers: {'Content-Type': 'application/json','Country-ID':SecureStorage.countryId,'Locale':SecureStorage.lang,
          'Authorization':SecureStorage.token!=null?'Bearer ${SecureStorage.token}':null,
        },
        receiveDataWhenStatusError: true),
  );

  static Future<Map<String, dynamic>> getData({String? endPoint,String? link}) async {
    Response res = endPoint!=null?await _dio.get(baseUrl + endPoint!) :await _dio.get(link!);
    return res.data;
  }

  static Future postData({required String endPoint, required postedData}) async {
    Response res = await _dio.post(baseUrl + endPoint, data: postedData);
    return res.data;
  }

  static Future putData({required String endPoint,}) async {
    Response res = await _dio.put(baseUrl+endPoint);
    return res.data;
  }

  static Future getNextLink({required String link}) async {
    Response res = await _dio.get(
      '$link',
    );
    return res.data;
  }

}