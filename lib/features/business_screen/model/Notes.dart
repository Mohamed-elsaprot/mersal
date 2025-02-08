class Notes {
  Notes({
      this.id, 
      this.name, 
      this.image,});

  Notes.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? image;
Notes copyWith({  num? id,
  String? name,
  String? image,
}) => Notes(  id: id ?? this.id,
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