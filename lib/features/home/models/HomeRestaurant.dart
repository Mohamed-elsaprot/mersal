import 'Banners.dart';

class HomeRestaurant {
  HomeRestaurant({
      this.uuid, 
      this.name, 
      this.description, 
      this.address, 
      this.logo, 
      this.orderArrivalRate, 
      this.section, 
      this.banners,});

  HomeRestaurant.fromJson(dynamic json) {
    uuid = json['uuid'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    logo = json['logo'];
    orderArrivalRate = json['order_arrival_rate'];
    section = json['section'];
    if (json['banners'] != null) {
      banners = [];
      json['banners'].forEach((v) {
        banners?.add(Banners.fromJson(v));
      });
    }
  }
  String? uuid;
  String? name;
  dynamic description;
  dynamic address;
  String? logo;
  num? orderArrivalRate;
  String? section;
  List<Banners>? banners;
HomeRestaurant copyWith({  String? uuid,
  String? name,
  dynamic description,
  dynamic address,
  String? logo,
  num? orderArrivalRate,
  String? section,
  List<Banners>? banners,
}) => HomeRestaurant(  uuid: uuid ?? this.uuid,
  name: name ?? this.name,
  description: description ?? this.description,
  address: address ?? this.address,
  logo: logo ?? this.logo,
  orderArrivalRate: orderArrivalRate ?? this.orderArrivalRate,
  section: section ?? this.section,
  banners: banners ?? this.banners,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['name'] = name;
    map['description'] = description;
    map['address'] = address;
    map['logo'] = logo;
    map['order_arrival_rate'] = orderArrivalRate;
    map['section'] = section;
    if (banners != null) {
      map['banners'] = banners?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}