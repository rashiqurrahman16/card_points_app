import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Hazari/pages/about_us.dart';
import 'package:Hazari/pages/rules_page.dart';
import 'package:Hazari/widgets/exit_confirmation_page.dart';

import '../boxes/boxes.dart';
import '../models/name_score_model.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<FinalScoreModel> finalScoresList = [];
  @override
  void initState() {
    super.initState();
    _retrieveNamesScores();
  }

  void _retrieveNamesScores() async {
    final box3 = Boxes.getFinalScores();
    final finalScores = box3.values.toList().cast<FinalScoreModel>();

    setState(() {
      finalScoresList = finalScores;
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
        children: [
          Container(
            width: screenSize.width,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              // borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Text("Previous Scores", style: TextStyle(
                color: Colors.orange.shade400,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
            ),
          ),
          SizedBox(
            height: screenSize.height - 220,
            child: ListView.builder(
              itemCount: finalScoresList.length,
              itemBuilder: (context, index) {
                final finalScoreData = finalScoresList[index];
                return ListTile(
                  title: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: screenSize.width*.80,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade500,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: screenSize.width*.20,
                                child: Text('1st', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),),
                              ),
                              Container(
                                  width: screenSize.width*.40,
                                  child: Text(finalScoreData.finalPlayer1, style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),)
                              ),
                              Container(
                                  width: screenSize.width*.15,
                                  child: Text(finalScoreData.finalScore1.toString(), style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),textAlign: TextAlign.right
                                  )
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: screenSize.width*.80,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade600,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: screenSize.width*.20,
                                child: Text('2nd', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),),
                              ),
                              Container(
                                  width: screenSize.width*.40,
                                  child: Text(finalScoreData.finalPlayer2, style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),)
                              ),
                              Container(
                                  width: screenSize.width*.15,
                                  child: Text(finalScoreData.finalScore2.toString(), style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),textAlign: TextAlign.right
                                  )
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: screenSize.width*.80,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade500,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: screenSize.width*.20,
                                child: Text('3rd', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),),
                              ),
                              Container(
                                  width: screenSize.width*.40,
                                  child: Text(finalScoreData.finalPlayer3, style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),)
                              ),
                              Container(
                                  width: screenSize.width*.15,
                                  child: Text(finalScoreData.finalScore3.toString(), style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),textAlign: TextAlign.right
                                  )
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: screenSize.width*.80,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade600,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: screenSize.width*.20,
                                child: Text('4th', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),),
                              ),
                              Container(
                                  width: screenSize.width*.40,
                                  child: Text(finalScoreData.finalPlayer4, style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),)
                              ),
                              Container(
                                  width: screenSize.width*.15,
                                  child: Text(finalScoreData.finalScore4.toString(), style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),textAlign: TextAlign.right
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Container(
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text("Name", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                    //             ],
                    //           ),
                    //         ),
                    //         SizedBox(height: 5,),
                    //         Container(
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text(finalScoreData.finalPlayer1)
                    //             ],
                    //           ),
                    //         ),
                    //         Container(
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text(finalScoreData.finalPlayer2)
                    //             ],
                    //           ),
                    //         ),
                    //         Container(
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text(finalScoreData.finalPlayer3)
                    //             ],
                    //           ),
                    //         ),
                    //         Container(
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text(finalScoreData.finalPlayer4)
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     SizedBox(width: 50,),
                    //     Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Container(
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text("Points", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                    //             ],
                    //           ),
                    //         ),
                    //         SizedBox(height: 5,),
                    //         Container(
                    //           width: screenSize.width/4,
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text(finalScoreData.finalScore1.toString()),
                    //             ],
                    //           ),
                    //         ),
                    //         Container(
                    //           width: screenSize.width/4,
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text(finalScoreData.finalScore2.toString()),
                    //             ],
                    //           ),
                    //         ),
                    //         Container(
                    //           width: screenSize.width/4,
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text(finalScoreData.finalScore3.toString()),
                    //             ],
                    //           ),
                    //         ),
                    //         Container(
                    //           width: screenSize.width/5,
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text(finalScoreData.finalScore4.toString()),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                  ),
                );
              }
            ),
          ),
        ]
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
                    onPressed: () => Navigator.pop(context),
                    child: Text("Back",
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
                    onPressed: (){_clearHistory();}, child: Text("Clear all",
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
        )

    );
  }

  Future<void> _clearHistory() async{
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Center(child: Text('Are you sure want to clear the history?', style: TextStyle(fontSize: 18),)),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    // width: 90,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
                          onPressed: () async{
                            Navigator.pop(context);
                          },
                          child: Text('Cancel', style: TextStyle(color: Colors.white, fontSize: 18),)
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade500),
                          onPressed: () async {
                            final box3 = Boxes.getFinalScores();
                            await box3.clear();
                            setState(() {
                              finalScoresList = [];
                            });
                            Navigator.of(context).popUntil((route) => route.isFirst);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HistoryPage()),
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

}
