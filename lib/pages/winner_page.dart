import 'package:flutter/material.dart';
import 'package:hazari/boxes/boxes.dart';
import 'package:hazari/pages/home_page.dart';
import 'package:hazari/pages/point_add_page.dart';
import 'package:hazari/pages/score_page.dart';
import 'package:hazari/models/name_score_model.dart';
import 'package:hazari/pages/total_score_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';



class WinnerPage extends StatefulWidget {
  const WinnerPage({super.key});

  @override
  State<WinnerPage> createState() => _WinnerPageState();
}

class _WinnerPageState extends State<WinnerPage> {

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
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Spacer(),
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Image(
                image: AssetImage('assets/Desktopit-logo.png'),
              ),
            ),
          ],
        ),
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),


      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ensure content fits within screen
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40), // Add padding around text
              decoration: BoxDecoration(
                color: Colors.blue, // Set background color
                borderRadius: BorderRadius.circular(10.0), // Add rounded corners
              ),
              child: const Column(
                children: [

                  Text(
                    'Winner',
                    style: TextStyle(
                      color: Colors.white, // Set text color for contrast
                      fontSize: 40.0, // Adjust font size as needed
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Text(
                        'ABCD',
                        style: TextStyle(
                          color: Colors.white, // Set text color for contrast
                          fontSize: 20.0, // Adjust font size as needed
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        '1000 pts',
                        style: TextStyle(
                          color: Colors.white, // Set text color for contrast
                          fontSize: 20.0, // Adjust font size as needed
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
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 64,
        width: 64,
        child: FloatingActionButton(
          elevation: 10,
          child: Text('Restart'),
          backgroundColor: Colors.blue,
          onPressed: () async {
            _showRestartDialog();
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
      ),
    );
  }


  Future<void> _showRestartDialog() async{
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Confirmation'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Are you sure want to restart the game"),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()
                      ),
                    );;
                  },
                  child: Text('Yes')
              )
            ],
          );
        });
  }

  // Text winnerName() {
  //   final winner = scoresList.maxBy((score) => calculateTotalScore(score));
  //   if (winner != null) {
  //     return Text(getPlayerName(winner)); // Assuming getPlayerName exists
  //   } else {
  //     return Text('No winner found'); // Handle case if no scores are present
  //   }
  // }

}

