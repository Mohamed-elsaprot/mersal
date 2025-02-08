// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartProductAdapter extends TypeAdapter<CartProduct> {
  @override
  final int typeId = 1;

  @override
  CartProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartProduct(
      image: fields[6] as String?,
      name: fields[7] as String?,
      productId: fields[0] as num?,
      quantity: fields[1] as num?,
      sizeId: fields[2] as num?,
      addonsSum: fields[9] as num?,
      note: fields[3] as String?,
      comprehensiveExtras: (fields[4] as List?)?.cast<ComprehensiveExtras>(),
      selectedSize: fields[8] as CartProductSize?,
      extras: (fields[5] as List?)?.cast<Extras>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartProduct obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.sizeId)
      ..writeByte(3)
      ..write(obj.note)
      ..writeByte(4)
      ..write(obj.comprehensiveExtras)
      ..writeByte(5)
      ..write(obj.extras)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.selectedSize)
      ..writeByte(9)
      ..write(obj.addonsSum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
