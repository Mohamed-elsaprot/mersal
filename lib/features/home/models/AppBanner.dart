class AppBanner {
  AppBanner({
      this.id, 
      this.status, 
      this.image, 
      this.createdAt, 
      this.updatedAt,});

  AppBanner.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  bool? status;
  String? image;
  String? createdAt;
  String? updatedAt;
AppBanner copyWith({  num? id,
  bool? status,
  String? image,
  String? createdAt,
  String? updatedAt,
}) => AppBanner(  id: id ?? this.id,
  status: status ?? this.status,
  image: image ?? this.image,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['status'] = status;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}