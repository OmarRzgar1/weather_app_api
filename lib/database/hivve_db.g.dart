// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hivve_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveInDatabaseAdapter extends TypeAdapter<SaveInDatabase> {
  @override
  final int typeId = 1;

  @override
  SaveInDatabase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveInDatabase(
      cityName: fields[0],
      condition: fields[1],
      temp: fields[2],
      windSpeed: fields[3],
      humidity: fields[4],
      windDirection: fields[5],
      lastUpdated: fields[6],
    );
  }

  @override
  void write(BinaryWriter writer, SaveInDatabase obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.cityName)
      ..writeByte(1)
      ..write(obj.condition)
      ..writeByte(2)
      ..write(obj.temp)
      ..writeByte(3)
      ..write(obj.windSpeed)
      ..writeByte(4)
      ..write(obj.humidity)
      ..writeByte(5)
      ..write(obj.windDirection)
      ..writeByte(6)
      ..write(obj.lastUpdated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveInDatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
