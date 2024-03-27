import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Hazari/models/name_score_model.dart';
import '../boxes/boxes.dart';
import '../widgets/exit_confirmation_page.dart';
import 'about_us.dart';
import 'home_page.dart';

class Player {
  String name;
  int score;
  Player(this.name, this.score);
}


class WinnerPage extends StatefulWidget {
  final String player1;
  final int totalScore1;
  final String player2;
  final int totalScore2;
  final String player3;
  final int totalScore3;
  final String player4;
  final int totalScore4;
  final String currentDate;

  const WinnerPage({
    required this.player1,
    required this.totalScore1,
    required this.player2,
    required this.totalScore2,
    required this.player3,
    required this.totalScore3,
    required this.player4,
    required this.totalScore4,
    required this.currentDate,
    super.key});

  @override
  State<WinnerPage> createState() => _WinnerPageState();
}

class _WinnerPageState extends State<WinnerPage> {
  List<Player> players = [];
  @override
  void initState() {
    super.initState();
    // Add players to the list
    players.add(Player(widget.player1, widget.totalScore1));
    players.add(Player(widget.player2, widget.totalScore2));
    players.add(Player(widget.player3, widget.totalScore3));
    players.add(Player(widget.player4, widget.totalScore4));
    // Sort players by score in descending order
    players.sort((a, b) => b.score.compareTo(a.score));

    // Save sorted data to FinalScoreModel
    _saveFinalScores();
  }
  void _saveFinalScores() async {
    final finalScoreBox = await Boxes.getFinalScores();
    final finalScores = FinalScoreModel(
      finalPlayer1: players[0].name,
      finalScore1: players[0].score,
      finalPlayer2: players[1].name,
      finalScore2: players[1].score,
      finalPlayer3: players[2].name,
      finalScore3: players[2].score,
      finalPlayer4: players[3].name,
      finalScore4: players[3].score,
      time: widget.currentDate,
    );
    if (finalScoreBox.length >= 3) {
      // Remove the oldest score (index 0) before adding a new one
      await finalScoreBox.deleteAt(0);
    }
    await finalScoreBox.add(finalScores);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: 35.0,
              height: 35.0,
              child: Image(
                image: AssetImage('assets/only_cards.png'),
              ),
            ),
            SizedBox(width: 5),
            Text(
              'হাজারি',
              style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,),
            ),
            Spacer(),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsPage()),
                    );
                  },
                  child:  SizedBox(
                    width: 35.0,
                    height: 35.0,
                    child: Image(
                      image: AssetImage('assets/Logo.png'),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),


      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop){
          if (didPop) {
            return; // Allow exiting the app
          }
          else {
            _showRefreshDialog();
            return; // Prevent immediate exit
          }
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/WinnerPageBckground.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            // height: screenSize.height/2.5,
            // width: screenSize.width / 1.5,
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   shape: BoxShape.rectangle,
            //   borderRadius: BorderRadius.circular(20.0),
            // ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text("স্কোরবোর্ড", style: TextStyle(color: Colors.blue.shade800, fontSize: 25, fontWeight: FontWeight.w800, ),)
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  // Container(
                  //   width: screenSize.width/2,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text("Name",
                  //         style: TextStyle(
                  //           color: Colors.black,
                  //           fontSize: 18,
                  //           // backgroundColor: Colors.white,
                  //         ),),
                  //       SizedBox(width: 15,),
                  //       Text("Points",
                  //         style: TextStyle(
                  //           color: Colors.black,
                  //           fontSize: 18,
                  //           // backgroundColor: Colors.white,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  for (int i = 0; i < players.length; i++)
                    Container(
                      width: screenSize.width*.90,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade800,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: screenSize.width*.20,
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: (i==0) ? Text("1st",
                              style: TextStyle(
                                color: Colors.lightGreen.shade400,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ) : (i==1) ? Text("2nd",
                              style: TextStyle(
                                color: Colors.yellow.shade600,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ) : (i==2) ? Text("3rd",
                              style: TextStyle(
                                color: Colors.tealAccent.shade400,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ) : Text("4th",
                              style: TextStyle(
                                color: Colors.orange.shade300,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ) ,
                          ),

                          Container(
                            width: screenSize.width*.40,
                            child: (i==0) ? Text(
                              players[i].name,
                              style: TextStyle(
                                color: Colors.lightGreen.shade400,
                                fontSize: 20,
                              ),
                            ) : (i==1) ? Text(
                              players[i].name,
                              style: TextStyle(
                                color: Colors.yellow.shade600,
                                fontSize: 20,
                              ),
                            ) : (i==2) ? Text(
                              players[i].name,
                              style: TextStyle(
                                color: Colors.tealAccent.shade400,
                                fontSize: 20,
                              ),
                            ) : Text(
                              players[i].name,
                              style: TextStyle(
                                color: Colors.orange.shade300,
                                fontSize: 20,
                              ),
                            ),
                          ),

                          Container(
                            width: screenSize.width*.25,
                            child: (i==0) ? Text(
                                players[i].score.toString()+" pts",
                                style: TextStyle(
                                  color: Colors.lightGreen.shade400,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.right
                            ) : (i==1) ? Text(
                                players[i].score.toString()+" pts",
                                style: TextStyle(
                                  color: Colors.yellow.shade600,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.right
                            ) : (i==2) ? Text(
                                players[i].score.toString()+" pts",
                                style: TextStyle(
                                  color: Colors.tealAccent.shade400,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.right
                            ) : Text(
                                players[i].score.toString()+" pts",
                                style: TextStyle(
                                  color: Colors.orange.shade300,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.right
                            ),
                          ),
                        ],
                      ),

                    ),
                ]
            ),
          )
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Colors.blue.shade600,
                        width: 2.0,
                      ),
                    ),
                  ),
                  onPressed: (){
                    _showRefreshDialog();
                  }, child: Text("পুনরারম্ভ",
                style: TextStyle(color: Colors.white, fontSize: 14),
              )),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Colors.blue.shade600,
                        width: 2.0,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    await ExitConfirmationPage().showExitConfirmationDialog(context);
                  }, child: Text("বাহির",
                style: TextStyle(color: Colors.white, fontSize: 14),
              )),
            ],
          ),

        ),
      ),
    );
  }

  Future<void> _showRefreshDialog() async{
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Center(child: Text('গেমটি পুনরায় চালু করতে চান?', style: TextStyle(fontSize: 18),)),

            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 90,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
                          onPressed: () async{
                            Navigator.pop(context);
                          },
                          child: Text('না', style: TextStyle(color: Colors.white, fontSize: 18),)
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  SizedBox(
                    height: 50,
                    width: 90,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade500),
                          onPressed: () async {
                            final box1 = Boxes.getNames();
                            final box2 = Boxes.getScores();
                            await box1.clear();
                            await box2.clear();
                            Navigator.of(context).popUntil((route) => route.isFirst);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage(
                                  )
                              ),
                            );
                          },
                          child: Text('হ্যাঁ', style: TextStyle(color: Colors.white, fontSize: 18),)
                      ),
                    ),
                  )
                ],
              )

            ],
          );
        });
  }

}
