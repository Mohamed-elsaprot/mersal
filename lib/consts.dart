import 'package:flutter/material.dart';
import 'package:mersal/features/home/view/home.dart';
import 'package:mersal/features/settings/view/settings.dart';

List screensList= [
  const Home(),null,null,const Settings()
];

String mealImage='https://static.vecteezy.com/system/resources/previews/025/521/387/non_2x/tasty-burger-meal-with-fries-photo.jpg';
String appBanner='https://graphicsfamily.com/wp-content/uploads/edd/2023/05/Website-Food-Banner-Design-1180x664.jpg';
String logo='https://www.creativehatti.com/wp-content/uploads/edd/2023/03/Tasty-cuisine-food-restaurant-banner-design-template-82-large.jpg';
String testDishImage='https://img.freepik.com/premium-photo/nigerian-beans-porridge-nigerian-dish-plate-white-background-directly-view_864588-12608.jpg';
String burgerImage = 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/burger-banner-design-template-9fdd9497e7022ae5102639be1e81460f_screen.jpg?ts=1648399095';

const String fontFamily = 'IBM Plex Sans Arabic';
const String imgUrl = 'https://app.mersal.cc/';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}