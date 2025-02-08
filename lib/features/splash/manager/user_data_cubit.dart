import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/core/local_storage/secure_storage.dart';
import 'package:mersal/core/models/Country.dart';
import 'package:mersal/core/models/Info.dart';
import 'package:mersal/features/splash/data/get_user_data_repo.dart';
import 'package:mersal/features/splash/manager/user_data_state.dart';

import '../../../core/models/Language.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.getUserDataRepo) : super(UserDataInitial());
  final GetUserDataRepo getUserDataRepo;
  List<Language> langList= [];
  List<Country> countriesList= [];
  Country? selectedCountry;
  Language? selectedLang;
  InfoModel? infoModel;


  Future getReqData()async{
    emit(UserDataLoading());
    var res = await getUserDataRepo.getUserData();
    res.fold(
          (failure)=>emit(UserDataFailure(errorMessage: failure.errorMessage)),
        (map){
            langList = map[0];
            countriesList = map[1];
            infoModel = map[2];
            emit(UserDataSuccess());
        }
    );
  }
  
  getSelected(){
    selectedCountry = countriesList.firstWhere((x)=>x.id!.toInt()==SecureStorage.countryId);
    selectedLang = langList.firstWhere((x)=>x.locale==SecureStorage.lang);
  }
}
