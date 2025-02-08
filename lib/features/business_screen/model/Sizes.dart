class Size {
  Size({
      this.id, 
      this.name, 
      this.price, 
      this.discount,});

  Size.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discount = json['discount'];
  }
  num? id;
  dynamic name;
  num? price;
  num? discount;
Size copyWith({  num? id,
  dynamic name,
  num? price,
  num? discount,
}) => Size(  id: id ?? this.id,
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