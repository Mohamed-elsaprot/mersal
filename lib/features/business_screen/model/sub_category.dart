import 'Product.dart';

class SubCategory{

  SubCategory({
    this.id,
    this.name,
    this.image,
    this.products
    ,});

  num? id;
  String? name;
  String? image;
  List<Product>? products;

  SubCategory.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Product.fromJson(v));
      });
    }
  }
}