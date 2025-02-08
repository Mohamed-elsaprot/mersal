import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/home/data/get_home_res_repo.dart';
import 'package:mersal/features/home/models/AppBanner.dart';
import 'package:mersal/features/home/models/HomeRestaurant.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getHomeResRepo) : super(HomeInitial());

  final GetHomeResRepo getHomeResRepo;
  List<HomeRestaurant> homeRestList = [];
  List<AppBanner> appBannerList = [];

  getHomeRestaurants() async {
    emit(HomeLoading());
    var res = await getHomeResRepo.getHomeRes();
    res.fold((failure) => emit(HomeFailure(errorMessage: failure.errorMessage)),
        (list) {
          homeRestList=list;
          emit(HomeSuccess());
        });
  }

  getAppBanner()async{
    emit(AppBannerLoading());
    var res = await getHomeResRepo.getAppBanner();
    res.fold((failure)=>emit(AppBannerFailure(errorMessage: failure.errorMessage)),
        (list){
          appBannerList=list;
          emit(AppBannerSuccess());
        });
  }
}
