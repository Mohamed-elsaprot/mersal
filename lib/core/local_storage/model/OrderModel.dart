import 'cart_product.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'OrderModel.g.dart';

@HiveType(typeId: 0)
class OrderModel {
  OrderModel({
      this.paymentMethod, 
      this.deliveryMethod, 
      this.note, 
      this.cityId, 
      this.coupon, 
      this.address, 
      this.restId,
      this.products,});


  @HiveField(0)
  num? paymentMethod;
  @HiveField(1)
  num? deliveryMethod;
  @HiveField(2)
  String? note;
  @HiveField(3)
  num? cityId;
  @HiveField(4)
  String? coupon;
  @HiveField(5)
  String? address;
  @HiveField(6)
  List<CartProduct>? products;
  @HiveField(7)
  String? restId;


  OrderModel copyWith({  num? paymentMethod,
  num? deliveryMethod,
  String? note,
  num? cityId,
  num? addonsSum,
  num? productPrice,
  String? coupon,
  String? address,
  String? restId,
  List<CartProduct>? products,
}) => OrderModel(  paymentMethod: paymentMethod ?? this.paymentMethod,
  deliveryMethod: deliveryMethod ?? this.deliveryMethod,
  note: note ?? this.note,
  cityId: cityId ?? this.cityId,
  coupon: coupon ?? this.coupon,
  address: address ?? this.address,
    restId: restId ?? this.restId,
  products: products ?? this.products,
);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['payment_method'] = paymentMethod;
    map['delivery_method'] = deliveryMethod;
    map['note'] = note;
    map['city_id'] = cityId;
    map['coupon'] = coupon;
    map['address'] = address;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}