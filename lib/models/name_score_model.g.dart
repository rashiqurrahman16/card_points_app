// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_score_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NameModelAdapter extends TypeAdapter<NameModel> {
  @override
  final int typeId = 0;

  @override
  NameModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NameModel(
      player1: fields[0] as String,
      player2: fields[1] as String,
      player3: fields[2] as String,
      player4: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NameModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.player1)
      ..writeByte(1)
      ..write(obj.player2)
      ..writeByte(2)
      ..write(obj.player3)
      ..writeByte(3)
      ..write(obj.player4);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NameModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ScoreModelAdapter extends TypeAdapter<ScoreModel> {
  @override
  final int typeId = 1;

  @override
  ScoreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScoreModel(
      score1: fields[0] as int,
      score2: fields[1] as int,
      score3: fields[2] as int,
      score4: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ScoreModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.score1)
      ..writeByte(1)
      ..write(obj.score2)
      ..writeByte(2)
      ..write(obj.score3)
      ..writeByte(3)
      ..write(obj.score4);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScoreModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FinalScoreModelAdapter extends TypeAdapter<FinalScoreModel> {
  @override
  final int typeId = 3;

  @override
  FinalScoreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinalScoreModel(
      finalPlayer1: fields[0] as String,
      finalScore1: fields[1] as int,
      finalPlayer2: fields[2] as String,
      finalScore2: fields[3] as int,
      finalPlayer3: fields[4] as String,
      finalScore3: fields[5] as int,
      finalPlayer4: fields[6] as String,
      finalScore4: fields[7] as int,
      time: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FinalScoreModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.finalPlayer1)
      ..writeByte(1)
      ..write(obj.finalScore1)
      ..writeByte(2)
      ..write(obj.finalPlayer2)
      ..writeByte(3)
      ..write(obj.finalScore2)
      ..writeByte(4)
      ..write(obj.finalPlayer3)
      ..writeByte(5)
      ..write(obj.finalScore3)
      ..writeByte(6)
      ..write(obj.finalPlayer4)
      ..writeByte(7)
      ..write(obj.finalScore4)
      ..writeByte(8)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinalScoreModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
