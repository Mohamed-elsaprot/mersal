import 'package:mersal/features/business_screen/model/sub_category.dart';

import 'Product.dart';

class Categories {
  Categories({
      this.id, 
      this.name, 
      this.image, 
      this.products, 
      this.subCategories,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Product.fromJson(v));
      });
    }
    if (json['subCategories'] != null) {
      subCategories = [];
      json['subCategories'].forEach((v) {
        subCategories?.add(SubCategory.fromJson(v));
      });
    }
  }
  num? id;
  String? name;
  String? image;
  List<Product>? products;
  List<SubCategory>? subCategories;
Categories copyWith({  num? id,
  String? name,
  String? image,
  List<Product>? products,
  List<SubCategory>? subCategories,
}) => Categories(  id: id ?? this.id,
  name: name ?? this.name,
  image: image ?? this.image,
  products: products ?? this.products,
  subCategories: subCategories ?? this.subCategories,
);


}