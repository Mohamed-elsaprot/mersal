class Extras {
  Extras({
      this.quantity,
      this.price,
      this.extraName,});

  Extras.fromJson(dynamic json) {
    quantity = json['quantity'];
    price = json['price'];
    extraName = json['extra_name'];
  }
  num? quantity;
  num? price;
  String? extraName;
Extras copyWith({  num? quantity,
  num? price,
  String? extraName,
}) => Extras(  quantity: quantity ?? this.quantity,
  price: price ?? this.price,
  extraName: extraName ?? this.extraName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = quantity;
    map['price'] = price;
    map['extra_name'] = extraName;
    return map;
  }

}