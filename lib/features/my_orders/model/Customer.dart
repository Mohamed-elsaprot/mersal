class Customer {
  Customer({
      this.name, 
      this.phone, 
      this.uuid,});

  Customer.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    uuid = json['uuid'];
  }
  String? name;
  String? phone;
  String? uuid;
Customer copyWith({  String? name,
  String? phone,
  String? uuid,
}) => Customer(  name: name ?? this.name,
  phone: phone ?? this.phone,
  uuid: uuid ?? this.uuid,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['uuid'] = uuid;
    return map;
  }

}