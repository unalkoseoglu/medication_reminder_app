// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pill_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PillModelAdapter extends TypeAdapter<PillModel> {
  @override
  final int typeId = 0;

  @override
  PillModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PillModel(
      name: fields[0] as String,
      amount: fields[5] as String,
      isComplete: fields[2] as bool,
      pillImage: fields[1] as String?,
      date: fields[3] as DateTime,
      time: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PillModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.pillImage)
      ..writeByte(2)
      ..write(obj.isComplete)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PillModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
