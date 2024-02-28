import 'package:flutter/material.dart';
import 'package:hazari/boxes/boxes.dart';
import 'package:hazari/pages/home_page.dart';
import 'package:hazari/pages/name_row_page.dart';
import 'package:hazari/pages/point_add_page.dart';
import 'package:hazari/pages/score_row_page.dart';
import 'package:hazari/pages/total_score_page.dart';
import 'package:hazari/pages/winner_page.dart';


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
    print("Saved Names:");
    for (var name in names) {
      print("- Player 1: ${name.player1}, Player 2: ${name.player2}, Player 3: ${name.player3}, Player 4: ${name.player4}");
    }
    print("Saved scores:");
    for (var score in scores) {
      print("- Player 1: ${score.score1}, Player 2: ${score.score2}, Player 3: ${score.score3}, Player 4: ${score.score4}");
    }
    //----------

  }


  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;


    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: Image(
                image: AssetImage('assets/3cards.png'),
              ),
            ),
            Text(
              'HAZARI',
              style: TextStyle(fontWeight: FontWeight.w500,),
            ),
            Spacer(),
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Image(
                image: AssetImage('assets/DesktopIt-logo-white.png'),
              ),
            ),
          ],
        ),
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children:[
        SizedBox(
          height: screenSize.height - 120,
          child: ListView.builder(
              itemCount: scoresList.length,
              itemBuilder: (context, index) {
                final scoreData = scoresList[index];

                return Column(
                      children: [
                        if (index == 0)
                          NameRow(player1: player1, player2: player2, player3: player3, player4: player4),

                        const SizedBox(height: 5),
                        ScoreRow(scoreData: scoreData),
                      ]
                  );

              }
              ),
        ),
        Positioned(
            bottom: 25.0,
            child: Column(
              children: [
              Text(
              "Total Score",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
              TotalScore(
                totalScore1: calculateTotalScore1(scoresList),
                totalScore2: calculateTotalScore2(scoresList),
                totalScore3: calculateTotalScore3(scoresList),
                totalScore4: calculateTotalScore4(scoresList),
              ),
              const SizedBox(height: 10),



              ],
            ),
          ),
        ]
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
                onPressed: (){
                  _showRefreshDialog();
                },
              ),
            ],
          ),

        ),
      )

    );
  }



  Future<void> _showRefreshDialog() async{
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Confirmation'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Are you sure want to refresh the score sheet"),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () async{
                    Navigator.pop(context);
                  },
                  child: Text('No')
              ),

              TextButton(
                  onPressed: () async {
                    final box = Boxes.getScores();
                    await box.clear();
                    setState(() {
                      scoresList = [];
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Yes')
              )
            ],
          );
        });
  }




}