import 'package:hive_flutter/hive_flutter.dart';
part 'ComprehensiveExtras.g.dart';

@HiveType(typeId: 2)
class ComprehensiveExtras {
  ComprehensiveExtras({
    this.extraId,
    this.quantity,
    this.groupId,
    this.name,
  });


  @HiveField(0)
  num? extraId;
  @HiveField(1)
  num? quantity;
  @HiveField(2)
  num? groupId;
  @HiveField(3)
  String? name;

ComprehensiveExtras copyWith({  num? extraId,
  num? quantity,
  num? groupId,
  String? name,
}) => ComprehensiveExtras(  extraId: extraId ?? this.extraId,
  quantity: quantity ?? this.quantity,
  groupId: groupId ?? this.groupId,
  name: name ?? this.name,
);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['extra_id'] = extraId;
    return map;
  }

}