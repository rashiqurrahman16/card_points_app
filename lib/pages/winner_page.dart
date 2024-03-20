import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  const WinnerPage({
    required this.player1,
    required this.totalScore1,
    required this.player2,
    required this.totalScore2,
    required this.player3,
    required this.totalScore3,
    required this.player4,
    required this.totalScore4,
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
                      Text("Scoreboard", style: TextStyle(color: Colors.blue.shade800, fontSize: 30, fontWeight: FontWeight.w800, ),),
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
                        // boxShadow: [ // Optional shadow effect
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.2), // Adjust opacity for subtlety
                        //     spreadRadius: 2.0, // Adjust spread for desired effect
                        //     blurRadius: 5.0, // Adjust blur for desired effect
                        //     offset: Offset(0.0, 2.0), // Adjust offset for shadow direction
                        //   ),
                        // ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: screenSize.width*.20,
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: (i==0) ? Text(
                              (i + 1).toString()+"st", // Rank
                              style: TextStyle(
                                color: Colors.lightGreen.shade400,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ) : (i==1) ? Text(
                              (i + 1).toString()+"nd", // Rank
                              style: TextStyle(
                                color: Colors.yellow.shade600,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ) : (i==2) ? Text(
                              (i + 1).toString()+"rd", // Rank
                              style: TextStyle(
                                color: Colors.tealAccent.shade400,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ) : Text(
                              (i + 1).toString()+"th", // Rank
                              style: TextStyle(
                                color: Colors.orange.shade300,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ) ,
                          ),

                          Container(
                            width: screenSize.width*.55,
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
                            width: screenSize.width*.10,
                            child: (i==0) ? Text(
                                players[i].score.toString(),
                                style: TextStyle(
                                  color: Colors.lightGreen.shade400,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.right
                            ) : (i==1) ? Text(
                                players[i].score.toString(),
                                style: TextStyle(
                                  color: Colors.yellow.shade600,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.right
                            ) : (i==2) ? Text(
                                players[i].score.toString(),
                                style: TextStyle(
                                  color: Colors.tealAccent.shade400,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.right
                            ) : Text(
                                players[i].score.toString(),
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



                  // Container(
                  //   width: screenSize.width/2,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text("${widget.player1}",
                  //         style: TextStyle(
                  //           color: Colors.orange.shade400,
                  //           fontSize: 25,
                  //         ),),
                  //       SizedBox(width: 15,),
                  //       Text("${widget.totalScore1}",
                  //         style: TextStyle(
                  //           color: Colors.orange.shade400,
                  //           fontSize: 18,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   width: screenSize.width/2,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text("${widget.player2}",
                  //         style: TextStyle(
                  //           color: Colors.orange.shade400,
                  //           fontSize: 25,
                  //         ),),
                  //       SizedBox(width: 15,),
                  //       Text("${widget.totalScore2}",
                  //         style: TextStyle(
                  //           color: Colors.orange.shade400,
                  //           fontSize: 18,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   width: screenSize.width/2,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text("${widget.player3}",
                  //         style: TextStyle(
                  //           color: Colors.orange.shade400,
                  //           fontSize: 25,
                  //         ),),
                  //       SizedBox(width: 15,),
                  //       Text("${widget.totalScore3}",
                  //         style: TextStyle(
                  //           color: Colors.orange.shade400,
                  //           fontSize: 18,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   width: screenSize.width/2,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text("${widget.player4}",
                  //         style: TextStyle(
                  //           color: Colors.orange.shade400,
                  //           fontSize: 25,
                  //         ),),
                  //       // SizedBox(width: 15,),
                  //       Text("${widget.totalScore4}",
                  //         style: TextStyle(
                  //           color: Colors.orange.shade400,
                  //           fontSize: 18,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
                  }, child: Text("Restart",
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
                  }, child: Text("Exit Game",
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
            title: Center(child: Text('Want to Restart the game?', style: TextStyle(fontSize: 18),)),

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
                          child: Text('No', style: TextStyle(color: Colors.white, fontSize: 18),)
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

}
