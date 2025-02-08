import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/core/local_storage/secure_storage.dart';
import 'package:mersal/core/services/api_service.dart';

import '../data/auth_repo_impl.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit(this.authRepoImpl):super(AuthInitial());
  final AuthRepoImpl authRepoImpl;
  String authType = 'login';
  int? id;
  String? name='User',phone='000000000';
  num? code;

  changeAuthType(String x){
    authType=x;
    emit(AuthInitial());
  }

  auth({required String userPhone,required String userName})async{
    emit(AuthLoading());
    Map data = authType=='login'? {"phone" : userPhone} : { "phone": userPhone, "country_id": "1", "name": userName };
    String endPoint = authType=='login'? ApiService.logIn:ApiService.signUp;
    var res = await authRepoImpl.auth(data: data, endPoint: endPoint);
    res.fold((failure){
      emit(AuthFailure(errorMessage: failure.errorMessage));
    }, (map){
      phone=userPhone;
      name=userName;
      code=map['code'];
      print(data);
      print(map);
      emit(AuthSuccess());
    });
  }

  confirmOtp({required String code})async{
    emit(AuthLoading());
    var res = await authRepoImpl.auth(data: {"phone" : phone}, endPoint: ApiService.checkOtp+code);
    res.fold((failure){
      emit(AuthFailure(errorMessage: failure.errorMessage));
    }, (map)async{
      phone=map['data']['phone'];
      name=map['data']['name'];
      await SecureStorage.setToken(map['data']['token']);
      emit(AuthSuccess());
    });  }
}