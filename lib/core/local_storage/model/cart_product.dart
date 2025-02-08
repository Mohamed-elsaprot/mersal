import 'ComprehensiveExtras.dart';
import 'Extras.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cart_product_size.dart';

part 'cart_product.g.dart';

@HiveType(typeId: 1)
class CartProduct {
  CartProduct({
      this.image,
      this.name,
      this.productId,
      this.quantity,
      this.sizeId, 
      this.note, 
      this.comprehensiveExtras, 
      this.selectedSize,
      this.addonsSum,
      this.extras,});

  @HiveField(0)
  num? productId;
  @HiveField(1)
  num? quantity;
  @HiveField(2)
  num? sizeId;
  @HiveField(3)
  String? note;
  @HiveField(4)
  List<ComprehensiveExtras>? comprehensiveExtras;
  @HiveField(5)
  List<Extras>? extras;
  @HiveField(6)
  String? image;
  @HiveField(7)
  String? name;
  @HiveField(8)
  CartProductSize? selectedSize;
  @HiveField(9)
  num? addonsSum;


CartProduct copyWith({  num? productId,
  num? quantity,
  num? sizeId,
  num? addonsSum,
  String? note,
  List<ComprehensiveExtras>? comprehensiveExtras,
  List<Extras>? extras,
  String? image,
  String? name,
  CartProductSize? selectedSize,
}) => CartProduct(  productId: productId ?? this.productId,
  quantity: quantity ?? this.quantity,
  sizeId: sizeId ?? this.sizeId,
  note: note ?? this.note,
  comprehensiveExtras: comprehensiveExtras ?? this.comprehensiveExtras,
  extras: extras ?? this.extras,
  image: image ?? this.image,
  name: name ?? this.name,
  selectedSize: selectedSize ?? this.selectedSize,
  addonsSum: addonsSum ?? this.addonsSum,
);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['quantity'] = quantity;
    map['size_id'] = sizeId;
    map['note'] = note;
    if (comprehensiveExtras != null) {
      map['comprehensive_extras'] = comprehensiveExtras?.map((v) => v.toJson()).toList();
    }
    if (extras != null) {
      map['extras'] = extras?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}