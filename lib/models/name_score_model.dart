

import 'package:hive/hive.dart';
part 'name_score_model.g.dart';


@HiveType(typeId: 0)
class NameModel {

  @HiveField(0)
  String player1;
  @HiveField(1)
  String player2;
  @HiveField(2)
  String player3;
  @HiveField(3)
  String player4;

  NameModel({
    required this.player1,
    required this.player2,
    required this.player3,
    required this.player4,
  });

}

@HiveType(typeId: 1)
class ScoreModel {

  @HiveField(0)
  int score1;
  @HiveField(1)
  int score2;
  @HiveField(2)
  int score3;
  @HiveField(3)
  int score4;

  ScoreModel({
    required this.score1,
    required this.score2,
    required this.score3,
    required this.score4,
  });

}

@HiveType(typeId: 3)
class FinalScoreModel {

  @HiveField(0)
  String finalPlayer1;
  @HiveField(1)
  int finalScore1;
  @HiveField(2)
  String finalPlayer2;
  @HiveField(3)
  int finalScore2;
  @HiveField(4)
  String finalPlayer3;
  @HiveField(5)
  int finalScore3;
  @HiveField(6)
  String finalPlayer4;
  @HiveField(7)
  int finalScore4;

  FinalScoreModel({
    required this.finalPlayer1,
    required this.finalScore1,
    required this.finalPlayer2,
    required this.finalScore2,
    required this.finalPlayer3,
    required this.finalScore3,
    required this.finalPlayer4,
    required this.finalScore4,
  });

}