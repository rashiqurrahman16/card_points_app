import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hazari/boxes/boxes.dart';
import 'package:hazari/pages/home_page.dart';
import 'package:hazari/pages/name_row_page.dart';

import 'package:hazari/pages/score_row_page.dart';
import 'package:hazari/pages/total_score_page.dart';
import 'package:hazari/pages/winner_page.dart';
import '../models/name_score_model.dart';
import '../widgets/add_points_page.dart';
import '../widgets/exit_confirmation_page.dart';
import 'about_us.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({
    super.key,
  });

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {

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
  int dealer=1;

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

    final nameData = names.last;
    setState(() {
      player1 = nameData.player1;
      player2 = nameData.player2;
      player3 = nameData.player3;
      player4 = nameData.player4;
    });
    setState(() {
      scoresList = scores;
    });
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
          _showRefreshDialog();
          return; // Prevent immediate exit
        }
      },
      child: Scaffold(

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
        body: ListView(
          children:[
            if((scoresList.length==0)||(scoresList.length%2==0 && scoresList.length%4==0))
              NameRow(dealer: 1, player1: player1, player2: player2, player3: player3, player4: player4),
            if(scoresList.length!=0 && scoresList.length%2!=0 && scoresList.length%4!=0 && (scoresList.length+1)%4!=0)
              NameRow(dealer: 2, player1: player1, player2: player2, player3: player3, player4: player4),
            if(scoresList.length%2==0 && scoresList.length%4!=0)
              NameRow(dealer: 3, player1: player1, player2: player2, player3: player3, player4: player4),
            if((scoresList.length+1)%4==0)
              NameRow(dealer: 4, player1: player1, player2: player2, player3: player3, player4: player4),



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

                          // (calculateTotalScore1(scoresList)>=500)?
                          // ((calculateTotalScore1(scoresList)!= calculateTotalScore2(scoresList) && calculateTotalScore1(scoresList)!= calculateTotalScore3(scoresList)
                          //     && calculateTotalScore1(scoresList)!= calculateTotalScore4(scoresList))
                          //     ?_riderctToWinnerPage(calculateTotalScore1(scoresList), calculateTotalScore2(scoresList), calculateTotalScore3(scoresList), calculateTotalScore4(scoresList))
                          //     :SizedBox()):SizedBox(),
                          // (calculateTotalScore2(scoresList)>=500)?
                          // ((calculateTotalScore2(scoresList)!= calculateTotalScore1(scoresList) && calculateTotalScore2(scoresList)!= calculateTotalScore3(scoresList)
                          //     && calculateTotalScore2(scoresList)!= calculateTotalScore4(scoresList))
                          //     ?_riderctToWinnerPage(calculateTotalScore1(scoresList), calculateTotalScore2(scoresList), calculateTotalScore3(scoresList), calculateTotalScore4(scoresList))
                          //     :SizedBox()):SizedBox(),
                          // (calculateTotalScore3(scoresList)>=500)?
                          // ((calculateTotalScore3(scoresList)!= calculateTotalScore1(scoresList) && calculateTotalScore3(scoresList)!= calculateTotalScore2(scoresList)
                          //     && calculateTotalScore3(scoresList)!= calculateTotalScore4(scoresList))
                          //     ?_riderctToWinnerPage(calculateTotalScore1(scoresList), calculateTotalScore2(scoresList), calculateTotalScore3(scoresList), calculateTotalScore4(scoresList))
                          //     :SizedBox()):SizedBox(),
                          // (calculateTotalScore4(scoresList)>=500)?
                          // ((calculateTotalScore4(scoresList)!= calculateTotalScore1(scoresList) && calculateTotalScore4(scoresList)!= calculateTotalScore2(scoresList)
                          //     && calculateTotalScore4(scoresList)!= calculateTotalScore3(scoresList))
                          //     ?_riderctToWinnerPage(calculateTotalScore1(scoresList), calculateTotalScore2(scoresList), calculateTotalScore3(scoresList), calculateTotalScore4(scoresList))
                          //     :SizedBox()):SizedBox(),


                          if (calculateTotalScore1(scoresList)>=500 && calculateTotalScore1(scoresList)>calculateTotalScore2(scoresList) && calculateTotalScore1(scoresList)>calculateTotalScore3(scoresList) && calculateTotalScore1(scoresList)>calculateTotalScore4(scoresList))
                              _riderctToWinnerPage(calculateTotalScore1(scoresList), calculateTotalScore2(scoresList), calculateTotalScore3(scoresList), calculateTotalScore4(scoresList)),
                          if (calculateTotalScore2(scoresList)>=500 && calculateTotalScore2(scoresList)>calculateTotalScore1(scoresList) && calculateTotalScore2(scoresList)>calculateTotalScore3(scoresList) && calculateTotalScore2(scoresList)>calculateTotalScore4(scoresList))
                            _riderctToWinnerPage(calculateTotalScore1(scoresList), calculateTotalScore2(scoresList), calculateTotalScore3(scoresList), calculateTotalScore4(scoresList)),
                          if (calculateTotalScore3(scoresList)>=500 && calculateTotalScore3(scoresList)>calculateTotalScore1(scoresList) && calculateTotalScore3(scoresList)>calculateTotalScore2(scoresList) && calculateTotalScore3(scoresList)>calculateTotalScore4(scoresList))
                            _riderctToWinnerPage(calculateTotalScore1(scoresList), calculateTotalScore2(scoresList), calculateTotalScore3(scoresList), calculateTotalScore4(scoresList)),
                          if (calculateTotalScore4(scoresList)>=500 && calculateTotalScore4(scoresList)>calculateTotalScore1(scoresList) && calculateTotalScore4(scoresList)>calculateTotalScore2(scoresList) && calculateTotalScore4(scoresList)>calculateTotalScore3(scoresList))
                            _riderctToWinnerPage(calculateTotalScore1(scoresList), calculateTotalScore2(scoresList), calculateTotalScore3(scoresList), calculateTotalScore4(scoresList)),
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
            onPressed: ()  {
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPointsPage(),
                ),
              );
            },
            child: Icon(
                Icons.add,
              color: Colors.orange.shade400,
              size: 30,
              shadows: [],
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 3, color: Colors.blue.shade50, strokeAlign: BorderSide.strokeAlignOutside),
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
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  icon: Icon(Icons.refresh),
                  onPressed: (){
                    _showRefreshDialog();
                  },
                ),
                IconButton(
                    color: Colors.orange.shade400,
                    iconSize: 30,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    icon: Icon(Icons.exit_to_app_outlined),
                    onPressed: () async {
                      await ExitConfirmationPage().showExitConfirmationDialog(context);
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
    _willRefresh = true;
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
                    width: 90,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
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
                    width: 90,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
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
                                              padding: const EdgeInsets.symmetric(vertical: 4),
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
                                                  onPressed: () async{
                                                    Navigator.pop(context);
                                                    bool _willRefresh = false;
                                                  },
                                                  child: Text('Cancel', style: TextStyle(color: Colors.white, fontSize: 18),)
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5,),
                                          SizedBox(
                                            height: 50,
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



  // void _redirectToAddPointPage(BuildContext context) async {
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => AddPointsPage(),
  //     ),
  //   );
  // }

  _riderctToWinnerPage(totalScore1, totalScore2, totalScore3, totalScore4) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WinnerPage(totalScore1: totalScore1, totalScore2: totalScore2, totalScore3: totalScore3, totalScore4: totalScore4,)),
      );
    });
  }




}