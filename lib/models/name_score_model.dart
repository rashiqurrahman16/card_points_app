

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
  @HiveField(4)
  int score2;
  @HiveField(5)
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