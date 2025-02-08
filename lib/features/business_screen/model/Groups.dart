import 'product_extra.dart';

class Groups {
  Groups({
      this.id, 
      this.name, 
      this.quantity, 
      this.quantityControl, 
      this.isRequired, 
      this.extras,});

  Groups.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    quantityControl = json['quantity_control'];
    isRequired = json['is_required'];
    if (json['extras'] != null) {
      extras = [];
      json['extras'].forEach((v) {
        extras?.add(ProductExtras.fromJson(v));
      });
    }
  }
  num? id;
  String? name;
  num? quantity;
  bool? quantityControl;
  bool? isRequired;
  List<ProductExtras>? extras;
Groups copyWith({  num? id,
  String? name,
  num? quantity,
  bool? quantityControl,
  bool? isRequired,
  List<ProductExtras>? extras,
}) => Groups(  id: id ?? this.id,
  name: name ?? this.name,
  quantity: quantity ?? this.quantity,
  quantityControl: quantityControl ?? this.quantityControl,
  isRequired: isRequired ?? this.isRequired,
  extras: extras ?? this.extras,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['quantity'] = quantity;
    map['quantity_control'] = quantityControl;
    map['is_required'] = isRequired;
    if (extras != null) {
      map['extras'] = extras?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}