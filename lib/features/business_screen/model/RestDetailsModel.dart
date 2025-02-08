import 'Restaurant.dart';
import 'Categories.dart';

class RestDetailsModel {
  RestDetailsModel({
      this.restaurant, 
      this.categories,});

  RestDetailsModel.fromJson(dynamic json) {
    restaurant = json['restaurant'] != null ? Restaurant.fromJson(json['restaurant']) : null;
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }
  Restaurant? restaurant;
  List<Categories>? categories;
RestDetailsModel copyWith({  Restaurant? restaurant,
  List<Categories>? categories,
}) => RestDetailsModel(  restaurant: restaurant ?? this.restaurant,
  categories: categories ?? this.categories,
);

}