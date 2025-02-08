import 'Open.dart';
import 'Banners.dart';

class Restaurant {
  Restaurant({
      this.uuid, 
      this.name, 
      this.description, 
      this.address, 
      this.logo, 
      this.orderArrivalRate, 
      this.section, 
      this.phone, 
      this.coordinates, 
      this.open, 
      this.banners,});

  Restaurant.fromJson(dynamic json) {
    uuid = json['uuid'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    logo = json['logo'];
    orderArrivalRate = json['order_arrival_rate'];
    section = json['section'];
    phone = json['phone'];
    coordinates = json['coordinates'] != null ? json['coordinates'].cast<String>() : [];
    open = json['open'] != null ? Open.fromJson(json['open']) : null;
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
  String? phone;
  List<String>? coordinates;
  Open? open;
  List<Banners>? banners;
Restaurant copyWith({  String? uuid,
  String? name,
  dynamic description,
  dynamic address,
  String? logo,
  num? orderArrivalRate,
  String? section,
  String? phone,
  List<String>? coordinates,
  Open? open,
  List<Banners>? banners,
}) => Restaurant(  uuid: uuid ?? this.uuid,
  name: name ?? this.name,
  description: description ?? this.description,
  address: address ?? this.address,
  logo: logo ?? this.logo,
  orderArrivalRate: orderArrivalRate ?? this.orderArrivalRate,
  section: section ?? this.section,
  phone: phone ?? this.phone,
  coordinates: coordinates ?? this.coordinates,
  open: open ?? this.open,
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
    map['phone'] = phone;
    map['coordinates'] = coordinates;
    if (open != null) {
      map['open'] = open?.toJson();
    }
    if (banners != null) {
      map['banners'] = banners?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}