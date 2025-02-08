import 'Extras.dart';

class MyOrderProducts {
  MyOrderProducts({
      this.price, 
      this.quantity, 
      this.name, 
      this.sizeName, 
      this.comprehensiveExtras, 
      this.extras, 
      this.image,});

  MyOrderProducts.fromJson(dynamic json) {
    price = json['price'];
    quantity = json['quantity'];
    name = json['name'];
    sizeName = json['size_name'];
    if (json['comprehensive_extras'] != null) {
      comprehensiveExtras = [];
      json['comprehensive_extras'].forEach((v) {
        // comprehensiveExtras?.add(Dynamic.fromJson(v));
        comprehensiveExtras?.add(v['extra_name']);
      });
    }
    if (json['extras'] != null) {
      extras = [];
      json['extras'].forEach((v) {
        extras?.add(Extras.fromJson(v));
      });
    }
    image = json['image'];
  }
  num? price;
  num? quantity;
  String? name;
  String? sizeName;
  List<String>? comprehensiveExtras;
  List<Extras>? extras;
  String? image;
MyOrderProducts copyWith({  num? price,
  num? quantity,
  String? name,
  String? sizeName,
  List<dynamic>? comprehensiveExtras,
  List<Extras>? extras,
  String? image,
}) => MyOrderProducts(  price: price ?? this.price,
  quantity: quantity ?? this.quantity,
  name: name ?? this.name,
  sizeName: sizeName ?? this.sizeName,
  // comprehensiveExtras: comprehensiveExtras ?? this.comprehensiveExtras,
  extras: extras ?? this.extras,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    map['quantity'] = quantity;
    map['name'] = name;
    map['size_name'] = sizeName;
    if (comprehensiveExtras != null) {
      map['comprehensive_extras'] = comprehensiveExtras;
          // ?.map((v) => v.toJson()).toList();
    }
    if (extras != null) {
      map['extras'] = extras?.map((v) => v.toJson()).toList();
    }
    map['image'] = image;
    return map;
  }

}