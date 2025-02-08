class Banners {
  Banners({
      this.name, 
      this.image,});

  Banners.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
  }
  String? name;
  String? image;
Banners copyWith({  String? name,
  String? image,
}) => Banners(  name: name ?? this.name,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    return map;
  }

}