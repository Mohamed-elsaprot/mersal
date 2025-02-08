class Images {
  Images({
      this.image, 
      this.id,});

  Images.fromJson(dynamic json) {
    image = json['image'];
    id = json['id'];
  }
  String? image;
  num? id;
Images copyWith({  String? image,
  num? id,
}) => Images(  image: image ?? this.image,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    map['id'] = id;
    return map;
  }

}