import 'package:flutter/material.dart';
import 'package:hazari/boxes/boxes.dart';
import 'package:hazari/pages/point_add_page.dart';

import '../models/name_score_model.dart';

class ScorePage extends StatefulWidget {


  const ScorePage({
    super.key,
  });

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {

  List<ScoreModel> scoresList = [];

  String player1 = "";
  String player2 = "";
  String player3 = "";
  String player4 = "";
  int score1 = 0;
  int score2 = 0;
  int score3 = 0;
  int score4 = 0;

  @override
  void initState() {
    super.initState();
    _retrieveNamesScores();
  }

  void _retrieveNamesScores() async {
    final box1 = Boxes.getNames();
    final names = box1.values.toList().cast<NameModel>();
    final box2 = Boxes.getScores();
    final scores = box2.values.toList().cast<ScoreModel>();

    final nameData = names.last; // Assuming there's only one set of names
    setState(() {
      player1 = nameData.player1;
      player2 = nameData.player2;
      player3 = nameData.player3;
      player4 = nameData.player4;
    });
    // final scoreData = scores.first; //
    setState(() {
      scoresList = scores;
    });

    // ---------- For Checking Names and scores
    // print("Saved Names:");
    // for (var name in names) {
    //   print("- Player 1: ${name.player1}, Player 2: ${name.player2}, Player 3: ${name.player3}, Player 4: ${name.player4}");
    // }
    // print("Saved scores:");
    // for (var score in scores) {
    //   print("- Player 1: ${score.score1}, Player 2: ${score.score2}, Player 3: ${score.score3}, Player 4: ${score.score4}");
    // }
    //----------

  }


  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;


    return Scaffold(
      appBar: AppBar(

        title: Text('Hazari'),
        toolbarHeight: 200,
        centerTitle: true,
        backgroundColor: Colors.blue,

      ),
      body: ListView.builder(
          itemCount: scoresList.length,
          itemBuilder: (context, index) {
            final scoreData = scoresList[index];

            return SafeArea(
              child: Column(
                  children: [
                    if (index==0)
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(
                                      width: 2, color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))
                              ),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(5),
                              width: screenSize.width / 4,
                              child: Text(player1, style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(
                                      width: 2, color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))
                              ),
                              alignment: Alignment.center,

                              padding: const EdgeInsets.all(5),
                              width: screenSize.width / 4,
                              child: Text(player2, style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(
                                      width: 2, color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))
                              ),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(5),
                              width: screenSize.width / 4,
                              child: Text(player3, style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(
                                      width: 2, color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))
                              ),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(5),
                              width: screenSize.width / 4,
                              child: Text(player4, style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),),
                            ),


                          ],
                        ),

                      ],
                    ),
                    const SizedBox(height: 10),
                    if (index!=0)
                    Column(
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
                    ),
                  ]
              ),


              // return ListTile(
              //   title: Text("score ${index + 1}"),
              //   subtitle: Text("score 1: ${scoreData.score1}"),
              //   trailing: Text("score 4: ${scoreData.score4}"),
              // );

            );
          }
    ),




      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 64,
        width: 64,
        child: FloatingActionButton(
          elevation: 10,
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PointAddPage(
                  )
              ),
            );
          },
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: Colors.white, strokeAlign: BorderSide.strokeAlignOutside),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: const CircularNotchedRectangle(),
        child: Container(
          alignment: Alignment.center,
          height: 10,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  color: Colors.white,
                  iconSize: 30,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  icon: Icon(Icons.minimize_rounded),
                  onPressed: (){},
              ),
              IconButton(
                color: Colors.white,
                iconSize: 30,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                icon: Icon(Icons.refresh),
                onPressed: (){},
              ),
            ],
          ),

        ),
      )

    );
  }
}