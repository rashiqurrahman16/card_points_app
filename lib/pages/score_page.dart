import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hazari/boxes/boxes.dart';
import 'package:hazari/pages/home_page.dart';
import 'package:hazari/pages/name_row_page.dart';
import 'package:hazari/pages/point_add_page.dart';
import 'package:hazari/pages/score_row_page.dart';
import 'package:hazari/pages/splash_screen.dart';
import 'package:hazari/pages/total_score_page.dart';
import 'package:hazari/pages/winner_page.dart';


import '../models/name_score_model.dart';
import '../widgets/add_points_page.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({
    super.key,
  });

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {

  bool _goToMainScreen = false;

  List<ScoreModel> scoresList = [];

  int winner = 0;
  String winnerName = "";
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

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop){
        if (didPop) {
          return; // Allow exiting the app
        }
        else {
          _goToMainScreenDialog();
          return; // Prevent immediate exit
        }
      },
      child: Scaffold(

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
        body: ListView(
          children:[
            NameRow(player1: player1, player2: player2, player3: player3, player4: player4),
          SizedBox(
            height: screenSize.height - 120,
            child: ListView.builder(
                itemCount: scoresList.length,
                itemBuilder: (context, index) {
                  final scoreData = scoresList[index];

                  return Column(
                        children: [
                          if (index == 0)

                          const SizedBox(height: 5),
                          ScoreRow(scoreData: scoreData),
                          if (index == scoresList.length - 1)
                            TotalScore(
                              totalScore1: calculateTotalScore1(scoresList),
                              totalScore2: calculateTotalScore2(scoresList),
                              totalScore3: calculateTotalScore3(scoresList),
                              totalScore4: calculateTotalScore4(scoresList),
                            ),

                        ]
                    );

                }
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

            backgroundColor: Colors.blue,
            onPressed: () => calculateTotalScore1(scoresList)>=400? _winningDialog(player1, calculateTotalScore1(scoresList))
                :calculateTotalScore2(scoresList)>=400? _winningDialog(player2, calculateTotalScore2(scoresList))
                :calculateTotalScore3(scoresList)>=400? _winningDialog(player3, calculateTotalScore3(scoresList))
                :calculateTotalScore4(scoresList)>=400? _winningDialog(player4, calculateTotalScore4(scoresList))
                :_redirectToAddPointPage(context),
            child: Icon(
                Icons.add,
              color: Colors.orange.shade400,
              size: 30,
              shadows: [],
            ),
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
                    color: Colors.orange.shade400,
                    iconSize: 30,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    icon: Icon(Icons.arrow_back),
                    onPressed: (){
                      _goToMainScreenDialog();
                    },
                ),
                IconButton(
                  color: Colors.orange.shade400,
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

      ),
    );
  }



  Future<void> _showRefreshDialog() async{
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Center(child: Text('Refresh the score?', style: TextStyle(fontSize: 18),)),

            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
                          onPressed: () async{
                            Navigator.pop(context);
                          },
                          child: Text('No', style: TextStyle(color: Colors.white, fontSize: 18),)
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade500),
                          onPressed: () async {
                            Navigator.pop(context);
                            await showDialog(
                                context: context,
                                builder: (context){
                                  return AlertDialog(
                                    title: Center(child: Text('Are you sure?')),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text("Current score will be reset", style: TextStyle(fontSize: 15),),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            child: Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
                                                  onPressed: () async{
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Cancel', style: TextStyle(color: Colors.white, fontSize: 18),)
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5,),
                                          SizedBox(
                                            height: 50,
                                            child: Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade500),
                                                  onPressed: () async {
                                                    final box2 = Boxes.getScores();
                                                    await box2.clear();
                                                    setState(() {
                                                      scoresList = [];
                                                    });
                                                    Navigator.of(context).popUntil((route) => route.isFirst);
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => const ScorePage()),
                                                    );
                                                  },
                                                  child: Text('Confirm', style: TextStyle(color: Colors.white, fontSize: 18),)
                                              ),
                                            ),
                                          )
                                        ],
                                      )

                                    ],
                                  );
                                });
                          },
                          child: Text('Yes', style: TextStyle(color: Colors.white, fontSize: 18),)
                      ),
                    ),
                  )
                ],
              )

            ],
          );
        });
  }

  Future<void> _winningDialog(winner, points) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.orange.shade400,
            alignment: Alignment.center,
            content: Column(
              mainAxisSize: MainAxisSize.min, // Ensure content fits within screen
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Winner',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            winner,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            points.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _redirectToAddPointPage(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddPointsPage(),
      ),
    );
  }

  Future<void> _goToMainScreenDialog() async {
    _goToMainScreen = true; // Set flag to prevent immediate exit
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create New Game?'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Cancel exit
                  _goToMainScreen = false; // Reset flag
                },
                child: Text('No', style: TextStyle(color: Colors.orange.shade400, fontSize: 20),),
              ),
              SizedBox(width: 40,),
              TextButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePage(
                        )
                    ),
                  ); // Exit the app
                },
                child: Text('Yes', style: TextStyle(color: Colors.green.shade400, fontSize: 20),),
              ),
            ],
          )

        ],
      ),
    );
  }



}