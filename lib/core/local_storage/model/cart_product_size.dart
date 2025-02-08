import 'package:hive_flutter/hive_flutter.dart';

part 'cart_product_size.g.dart';

@HiveType(typeId: 4)
class CartProductSize {
  CartProductSize({
    this.id,
    this.name,
    this.price,
    this.discount,});

  CartProductSize.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discount = json['discount'];
  }
  @HiveField(0)
  num? id;
  @HiveField(1)
  dynamic name;
  @HiveField(2)
  num? price;
  @HiveField(3)
  num? discount;


  CartProductSize copyWith({  num? id,
    dynamic name,
    num? price,
    num? discount,
  }) => CartProductSize(  id: id ?? this.id,
    name: name ?? this.name,
    price: price ?? this.price,
    discount: discount ?? this.discount,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['price'] = price;
    map['discount'] = discount;
    return map;
  }

}