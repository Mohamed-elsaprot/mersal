import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class AppLocalization {
  static changeLang(BuildContext c, String locale) {
      EasyLocalization.of(c)!.setLocale(Locale(locale));
  }
}
