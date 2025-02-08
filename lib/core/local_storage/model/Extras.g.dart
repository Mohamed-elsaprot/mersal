// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Extras.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExtrasAdapter extends TypeAdapter<Extras> {
  @override
  final int typeId = 3;

  @override
  Extras read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Extras(
      extraId: fields[0] as num?,
      quantity: fields[1] as num?,
      groupId: fields[2] as num?,
      extraPrice: fields[3] as num?,
      name: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Extras obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.extraId)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.groupId)
      ..writeByte(3)
      ..write(obj.extraPrice)
      ..writeByte(4)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtrasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
