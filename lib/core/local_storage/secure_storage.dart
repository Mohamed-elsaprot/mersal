import 'package:flutter_secure_storage/flutter_secure_storage.dart';
abstract class SecureStorage{
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static const String tokenKey='tokenKey';
  static const String langKey='langKey';
  static const String countryKey='countryKey';

  static String? token,lang;
  static int? countryId;

  static Future deleteToken()async{
    storage.delete(key: tokenKey);
    // await storage.delete(key: langKey);
    token = null;
    // storage.delete(key: countryKey);
  }

  static initSecureStorage()async{
    token = await storage.read(key: tokenKey);
    lang = await storage.read(key: langKey);
    String? c = await storage.read(key: countryKey);
    countryId = int.tryParse(c??'');
    print(token);
  }

  static Future setToken(String x)async{
    token = x;
    await storage.write(key: tokenKey, value: x);
  }

  static Future removeToken()async{
    token = null;
    await storage.delete(key: tokenKey);
  }

  static Future setLang(String x)async{
    lang = x;
    await storage.write(key: langKey, value: x.toString());
  }

  static Future setCountryId(int x)async{
    countryId = x;
    await storage.write(key: countryKey, value: x.toString());
  }

}