import 'package:hive_flutter/hive_flutter.dart';

part 'Extras.g.dart';

@HiveType(typeId: 3)
class Extras {
  Extras({
      this.extraId, 
      this.quantity, 
      this.groupId,
      this.extraPrice,
      this.name,
  });

  @HiveField(0)
  num? extraId;
  @HiveField(1)
  num? quantity;
  @HiveField(2)
  num? groupId;
  @HiveField(3)
  num? extraPrice;
  @HiveField(4)
  String? name;

Extras copyWith({  num? extraId,
  num? quantity,
  num? groupId,
  num? extraPrice,
  String? name,
}) => Extras(  extraId: extraId ?? this.extraId,
  quantity: quantity ?? this.quantity,
  groupId: groupId ?? this.groupId,
  extraPrice: extraId ?? this.extraPrice,
  name: name ?? this.name,
);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['extra_id'] = extraId;
    map['quantity'] = quantity;
    map['group_id'] = groupId;
    return map;
  }

}