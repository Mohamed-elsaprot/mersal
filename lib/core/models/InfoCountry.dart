import 'city.dart';

class InfoCountry {
  InfoCountry({
      this.name, 
      this.id, 
      this.cities,});

  InfoCountry.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    if (json['cities'] != null) {
      cities = [];
      json['cities'].forEach((v) {
        cities?.add(City.fromJson(v));
      });
    }
  }
  String? name;
  num? id;
  List<City>? cities;
InfoCountry copyWith({  String? name,
  num? id,
  List<City>? cities,
}) => InfoCountry(  name: name ?? this.name,
  id: id ?? this.id,
  cities: cities ?? this.cities,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    if (cities != null) {
      map['cities'] = cities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}