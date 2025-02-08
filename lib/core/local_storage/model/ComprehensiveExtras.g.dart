// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ComprehensiveExtras.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComprehensiveExtrasAdapter extends TypeAdapter<ComprehensiveExtras> {
  @override
  final int typeId = 2;

  @override
  ComprehensiveExtras read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ComprehensiveExtras(
      extraId: fields[0] as num?,
      quantity: fields[1] as num?,
      groupId: fields[2] as num?,
      name: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ComprehensiveExtras obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.extraId)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.groupId)
      ..writeByte(3)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComprehensiveExtrasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
