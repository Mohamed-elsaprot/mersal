import 'InfoCountry.dart';

class InfoModel {
  InfoModel({
      this.name, 
      this.phone, 
      this.infoCountry,});

  InfoModel.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    infoCountry = json['country'] != null ? InfoCountry.fromJson(json['country']) : null;
  }
  String? name;
  String? phone;
  InfoCountry? infoCountry;
  InfoModel copyWith({  String? name,
  String? phone,
  InfoCountry? infoCountry,
}) => InfoModel(  name: name ?? this.name,
  phone: phone ?? this.phone,
  infoCountry: infoCountry ?? this.infoCountry,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    if (infoCountry != null) {
      map['country'] = infoCountry?.toJson();
    }
    return map;
  }

}