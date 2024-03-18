import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../boxes/boxes.dart';
import '../data/players_page.dart';
import '../models/name_score_model.dart';
import '../widgets/exit_confirmation_page.dart';
import 'about_us.dart';
import 'home_page.dart';


class WinnerPage extends StatefulWidget {
  final int totalScore1;
  final int totalScore2;
  final int totalScore3;
  final int totalScore4;

  const WinnerPage({
    required this.totalScore1,
    required this.totalScore2,
    required this.totalScore3,
    required this.totalScore4,
    super.key});

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
  late List <int> finalScores = [widget.totalScore1, widget.totalScore2, widget.totalScore3, widget.totalScore4];



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
      finalScores.sort();
    });
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
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => AboutUsPage()),
                //     );
                //   },
                //   child: Text(
                //     "আমাদের সম্পর্কে",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 16,
                //       fontWeight: FontWeight.w400,
                //     ),
                //   ),
                // ),
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
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Congrats!", style: TextStyle(color: Colors.blue, fontSize: 30),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: screenSize.width/2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            // backgroundColor: Colors.white,
                          ),),
                        SizedBox(width: 15,),
                        Text("Points",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            // backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: screenSize.width/2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(player1,
                          style: TextStyle(
                            color: Colors.orange.shade400,
                            fontSize: 25,
                            // backgroundColor: Colors.white,
                          ),),
                        SizedBox(width: 15,),
                        Text("${widget.totalScore1}",
                          style: TextStyle(
                            color: Colors.orange.shade400,
                            fontSize: 18,
                            // backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenSize.width/2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(player2,
                          style: TextStyle(
                            color: Colors.orange.shade400,
                            fontSize: 25,
                            // backgroundColor: Colors.white,
                          ),),
                        SizedBox(width: 15,),
                        Text("${widget.totalScore2}",
                          style: TextStyle(
                            color: Colors.orange.shade400,
                            fontSize: 18,
                            // backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenSize.width/2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(player3,
                          style: TextStyle(
                            color: Colors.orange.shade400,
                            fontSize: 25,
                            // backgroundColor: Colors.white,
                          ),),
                        SizedBox(width: 15,),
                        Text("${widget.totalScore3}",
                          style: TextStyle(
                            color: Colors.orange.shade400,
                            fontSize: 18,
                            // backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenSize.width/2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(player4,
                          style: TextStyle(
                            color: Colors.orange.shade400,
                            fontSize: 25,
                            // backgroundColor: Colors.white,
                          ),),
                        // SizedBox(width: 15,),
                        Text("${widget.totalScore4}",
                          style: TextStyle(
                            color: Colors.orange.shade400,
                            fontSize: 18,
                            // backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayersPage(),
                      ),
                    );

                  }, child: Text("a"))
                ]
            )


            //   (widget.totalScore1>widget.totalScore2 && widget.totalScore1>widget.totalScore3 && widget.totalScore1>widget.totalScore4)
            //     ?(widget.totalScore2>=widget.totalScore3 && widget.totalScore2>=widget.totalScore4)
            //     ?(widget.totalScore3>=widget.totalScore4)?
            //
            //     : Container()
            //     :SizedBox()
            //     :(widget.totalScore2>widget.totalScore1 && widget.totalScore2>widget.totalScore3 && widget.totalScore2>widget.totalScore4)
            //     ?(widget.totalScore1>=widget.totalScore3 && widget.totalScore1>=widget.totalScore4)
            //     ?(widget.totalScore3>=widget.totalScore4)?
            // Container()
            //     :SizedBox()
            //     :SizedBox()
            //     :(widget.totalScore3>widget.totalScore1 && widget.totalScore3>widget.totalScore2 && widget.totalScore3>widget.totalScore4)
            //     ?(widget.totalScore1>=widget.totalScore2 && widget.totalScore1>=widget.totalScore4)
            //     ?(widget.totalScore2>=widget.totalScore4)?
            // Container()
            //     :SizedBox()
            //     :SizedBox()
            //     :(widget.totalScore4>widget.totalScore1 && widget.totalScore4>widget.totalScore2 && widget.totalScore4>widget.totalScore3)
            //     ?(widget.totalScore1>=widget.totalScore2 && widget.totalScore1>=widget.totalScore3)
            //     ?(widget.totalScore2>=widget.totalScore3)?
            // Container()
            //     :SizedBox()
            //     :SizedBox()
            //     :SizedBox()
            ,
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
                        color: Colors.blue.shade600,  // Set border color to white
                        width: 2.0,           // Adjust border width as desired
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
                        color: Colors.blue.shade600,  // Set border color to white
                        width: 2.0,           // Adjust border width as desired
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
