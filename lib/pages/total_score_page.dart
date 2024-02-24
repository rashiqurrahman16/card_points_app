


import 'package:flutter/material.dart';

import '../models/name_score_model.dart';

int calculateTotalScore1(List<ScoreModel> scoresList){
  int totalScore1 = 0;
  for( var score in scoresList) {
    totalScore1 += score.score1;
  }
  return totalScore1;
}
int calculateTotalScore2(List<ScoreModel> scoresList){
  int totalScore2 = 0;
  for( var score in scoresList) {
    totalScore2 += score.score2;
  }
  return totalScore2;
}
int calculateTotalScore3(List<ScoreModel> scoresList){
  int totalScore3 = 0;
  for( var score in scoresList) {
    totalScore3 += score.score3;
  }
  return totalScore3;
}
int calculateTotalScore4(List<ScoreModel> scoresList){
  int totalScore4 = 0;
  for( var score in scoresList) {
    totalScore4 += score.score4;
  }
  return totalScore4;
}

class TotalScore extends StatelessWidget {

  final int totalScore1;
  final int totalScore2;
  final int totalScore3;
  final int totalScore4;

  const TotalScore({

    required this.totalScore1,
    required this.totalScore2,
    required this.totalScore3,
    required this.totalScore4,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;

    return Column(
      children: [
        Row(

          children: [


            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  border: Border.all(width: 2, color: Colors.black),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text("$totalScore1",
                style: const TextStyle(color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(width: 2, color: Colors.black),
              ),
              alignment: Alignment.center,

              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text("$totalScore2",
                style: const TextStyle(color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(width: 2, color: Colors.black),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text("$totalScore3",
                style: const TextStyle(color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(width: 2, color: Colors.black),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text("$totalScore4",
                style: const TextStyle(color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),),
            ),

          ],
        ),

      ],
    );
  }
}
