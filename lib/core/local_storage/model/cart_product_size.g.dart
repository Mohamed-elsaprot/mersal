// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_size.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartProductSizeAdapter extends TypeAdapter<CartProductSize> {
  @override
  final int typeId = 4;

  @override
  CartProductSize read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartProductSize(
      id: fields[0] as num?,
      name: fields[1] as dynamic,
      price: fields[2] as num?,
      discount: fields[3] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, CartProductSize obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.discount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProductSizeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
