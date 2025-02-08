class ProductExtras {
  ProductExtras({
      this.id, 
      this.name, 
      this.price, 
      this.image,});

  ProductExtras.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
  }
  num? id;
  String? name;
  num? price;
  String? image;
ProductExtras copyWith({  num? id,
  String? name,
  num? price,
  String? image,
}) => ProductExtras(  id: id ?? this.id,
  name: name ?? this.name,
  price: price ?? this.price,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['price'] = price;
    map['image'] = image;
    return map;
  }

}