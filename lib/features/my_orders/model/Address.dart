class Address {
  Address({
      this.address,});

  Address.fromJson(dynamic json) {
    address = json['address'];
  }
  String? address;
Address copyWith({  String? address,
}) => Address(  address: address ?? this.address,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    return map;
  }

}