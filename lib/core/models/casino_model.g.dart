// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casino_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DateAdapter extends TypeAdapter<Date> {
  @override
  final int typeId = 0;

  @override
  Date read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Date(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Date obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.day);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlayerAdapter extends TypeAdapter<Player> {
  @override
  final int typeId = 2;

  @override
  Player read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Player(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as PlayerType,
      fields[4] as double,
      fields[5] as double,
      fields[6] as double,
      fields[7] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Player obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.idPlayer)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.playerType)
      ..writeByte(4)
      ..write(obj.bankroll)
      ..writeByte(5)
      ..write(obj.sessionMoney)
      ..writeByte(6)
      ..write(obj.totalProfit)
      ..writeByte(7)
      ..write(obj.totalMoneyBetted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CasinoAdapter extends TypeAdapter<Casino> {
  @override
  final int typeId = 3;

  @override
  Casino read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Casino(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as Date,
      (fields[4] as Map).cast<String, Player>(),
    );
  }

  @override
  void write(BinaryWriter writer, Casino obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.casinoProfit)
      ..writeByte(1)
      ..write(obj.sessionID)
      ..writeByte(2)
      ..write(obj.idPlayer)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.mapPlayers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CasinoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlayerTypeAdapter extends TypeAdapter<PlayerType> {
  @override
  final int typeId = 1;

  @override
  PlayerType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PlayerType.NORMAL;
      case 1:
        return PlayerType.VIP;
      case 2:
        return PlayerType.BANNED;
      default:
        return PlayerType.NORMAL;
    }
  }

  @override
  void write(BinaryWriter writer, PlayerType obj) {
    switch (obj) {
      case PlayerType.NORMAL:
        writer.writeByte(0);
        break;
      case PlayerType.VIP:
        writer.writeByte(1);
        break;
      case PlayerType.BANNED:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
