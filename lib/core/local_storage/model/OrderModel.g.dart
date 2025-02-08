// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderModelAdapter extends TypeAdapter<OrderModel> {
  @override
  final int typeId = 0;

  @override
  OrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModel(
      paymentMethod: fields[0] as num?,
      deliveryMethod: fields[1] as num?,
      note: fields[2] as String?,
      cityId: fields[3] as num?,
      coupon: fields[4] as String?,
      address: fields[5] as String?,
      products: (fields[6] as List?)?.cast<CartProduct>(),
      restId: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.paymentMethod)
      ..writeByte(1)
      ..write(obj.deliveryMethod)
      ..writeByte(2)
      ..write(obj.note)
      ..writeByte(3)
      ..write(obj.cityId)
      ..writeByte(4)
      ..write(obj.coupon)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.products)
      ..writeByte(7)
      ..write(obj.restId)
    ;
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
