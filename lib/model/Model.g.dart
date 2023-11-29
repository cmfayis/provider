// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudetModelAdapter extends TypeAdapter<StudetModel> {
  @override
  final int typeId = 1;

  @override
  StudetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudetModel(
      name: fields[0] as String,
      age: fields[1] as String,
      email: fields[2] as String,
      phone: fields[3] as String,
      course: fields[4] as String,
      image: fields[5] as Uint8List,
    );
  }

  @override
  void write(BinaryWriter writer, StudetModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.course)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
