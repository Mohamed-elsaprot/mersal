import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mersal/features/settings/data/settings_repo.dart';
import 'package:mersal/features/settings/manager/settings_state.dart';
import 'package:mersal/features/settings/model/ContentPage.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.repo) : super(SettingsInitial());
  final SettingsRepo repo;

  List<ContentPage> pagesList=[];

  getSettings()async{
    var res = await repo.getPages();
    res.fold((failure){}, (list){
      pagesList=list;
      emit(SettingsInitial());
    });
  }
}
