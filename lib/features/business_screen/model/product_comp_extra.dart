class ProductCompExtra {
  ProductCompExtra({
      this.id, 
      this.name, 
      this.image,});

  ProductCompExtra.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? image;
ProductCompExtra copyWith({  num? id,
  String? name,
  String? image,
}) => ProductCompExtra(  id: id ?? this.id,
  name: name ?? this.name,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }

}