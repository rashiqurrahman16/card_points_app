import 'package:flutter/material.dart';
import 'package:hazari/models/name_score_model.dart';


class ScoreRow extends StatelessWidget {
  const ScoreRow({
    required this.scoreData,
    super.key
  });

  final ScoreModel scoreData;


  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;


    return Column(
      children: [
        Row(

          children: [


            Container(
              // decoration: BoxDecoration(
              //     color: Colors.grey,
              //     border: Border.all(width: 2, color: Colors.white),
              //     borderRadius: BorderRadius.all(Radius.circular(10))
              // ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text("${scoreData.score1}",
                style: const TextStyle(color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),),
            ),
            Container(
              // decoration: BoxDecoration(
              //     color: Colors.grey,
              //     border: Border.all(width: 2, color: Colors.white),
              //     borderRadius: BorderRadius.all(Radius.circular(10))
              // ),
              alignment: Alignment.center,

              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text("${scoreData.score2}",
                style: const TextStyle(color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),),
            ),
            Container(
              // decoration: BoxDecoration(
              //     color: Colors.grey,
              //     border: Border.all(width: 2, color: Colors.white),
              //     borderRadius: BorderRadius.all(Radius.circular(10))
              // ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text("${scoreData.score3}",
                style: const TextStyle(color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),),
            ),
            Container(
              // decoration: BoxDecoration(
              //   color: Colors.grey,
              //   border: Border.all(width: 2, color: Colors.white),
              //   borderRadius: BorderRadius.all(Radius.circular(10))
              // ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text("${scoreData.score4}",
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
