

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../boxes/boxes.dart';
import '../models/name_score_model.dart';
import 'home_page.dart';


class WinnerPage extends StatefulWidget {

  final String winner;
  final int winningScore;

  const WinnerPage({
    required this.winner,
    required this.winningScore,
    super.key});

  @override
  State<WinnerPage> createState() => _WinnerPageState();
}

class _WinnerPageState extends State<WinnerPage> {

  bool _willRefresh = false;

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


      body: Center(
        child: Container(
            height: screenSize.height/4,
            width: screenSize.width / 1.5,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 70.0,
                      height: 70.0,
                      child: Image(
                        image: AssetImage('assets/3cards.png'),
                      ),
                    ),
                    Text(
                      'HAZARI',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),
                    ),
                  ],
                ),
                Text("Winner", style: TextStyle(color: Colors.white, fontSize: 30),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${widget.winner}"),
                    SizedBox(width: 10,),
                    Text("${widget.winningScore}"),
                  ],
                ),

                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  _showRefreshDialog();
                },
                    child: Text("Restart"))
              ],
            ),
          ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: Colors.white,  // Set border color to white
                    width: 2.0,           // Adjust border width as desired
                  ),
                ),
              ),
              onPressed: (){
                _showExitConfirmationDialog();
              },
              child: Text('Exit', style: TextStyle(color: Colors.white),)),
        ),

      ),
    );
  }

  Future<void> _showRefreshDialog() async{
    _willRefresh = true;
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Center(child: Text('Want to Restart the game?', style: TextStyle(fontSize: 18),)),

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
                            bool _willRefresh = false;
                          },
                          child: Text('No', style: TextStyle(color: Colors.white, fontSize: 18),)
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade500),
                          onPressed: () async {
                            final box1 = Boxes.getNames();
                            final box2 = Boxes.getScores();
                            await box1.clear();
                            await box2.clear();
                            setState(() {
                              scoresList = [];
                            });
                            Navigator.of(context).popUntil((route) => route.isFirst);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage(
                                  )
                              ),
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
  }

  Future<void> _showExitConfirmationDialog() async {
    // Set flag to prevent immediate exit
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: Text('Exit Confirmation', style: TextStyle(fontSize: 18),)),
        content: Text('Are you sure you want to exit the app?'),
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
                    onPressed: () {
                      Navigator.pop(context); // Cancel exit
                    },
                    child: Text('No', style: TextStyle(color: Colors.white, fontSize: 18),),
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
                    onPressed: () {
                      SystemNavigator.pop(); // Exit the app
                    },
                    child: Text('Yes', style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
