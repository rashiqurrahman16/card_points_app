import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hazari/boxes/boxes.dart';
import 'package:hazari/pages/about_us.dart';
import 'package:hazari/pages/rules_page.dart';
import 'package:hazari/pages/score_page.dart';
import 'package:hazari/models/name_score_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hazari/widgets/exit_confirmation_page.dart';

import '../widgets/name_confirmation_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  late Box namesBox;
  late Box scoreBox;

  final player1Controller = TextEditingController();
  final player2Controller = TextEditingController();
  final player3Controller = TextEditingController();
  final player4Controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    namesBox = Boxes.getNames();
    namesBox.clear();
    scoreBox = Boxes.getScores();
    scoreBox.clear();// Clear the box's data
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
            ExitConfirmationPage().showExitConfirmationDialog(context);
            return; // Prevent immediate exit
          }
        },
        child: SafeArea(
          child: ValueListenableBuilder<Box<NameModel>>(
            valueListenable: Boxes.getNames().listenable(),
            builder: (context, box, _) {
              var nameData = box.values.toList().cast<NameModel>();
              return ListView(
                children: [
                  SizedBox(height: 10,),
                  Center(
                    child: Text(
                        "Players Name",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: TextField(
                        controller: player1Controller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(

                            ),
                            labelText: "Player 1 - Dealer",
                          counterText: "",
                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
                        maxLength: 8,
                      )
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: TextField(
                        controller: player2Controller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Player 2",
                          counterText: "",
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
                        maxLength: 8,
                      )
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: TextField(
                        controller: player3Controller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Player 3",
                          counterText: "",
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
                        maxLength: 8,
                      )
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: TextField(
                        controller: player4Controller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Player 4",
                          counterText: "",
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
                        maxLength: 8,
                      )
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () async{
                            final player1 = player1Controller.text;
                            final player2 = player2Controller.text;
                            final player3 = player3Controller.text;
                            final player4 = player4Controller.text;

                            if (player1.isEmpty || player2.isEmpty || player3.isEmpty || player4.isEmpty) {
                              _emptyDialog();
                              return; // Prevent saving and showing the dialog
                            }

                            // Check for duplicate names
                            if (player1 == player2 ||
                                player1 == player3 ||
                                player1 == player4 ||
                                player2 == player3 ||
                                player2 == player4 ||
                                player3 == player4) {
                              // Show an error Dialog if duplicates found
                              _sameNameErrorDialog();
                              return; // Prevent saving and showing the dialog
                            }

                            final nameData = NameModel(
                                player1: player1Controller.text,
                                player2: player2Controller.text,
                                player3: player3Controller.text,
                                player4: player4Controller.text
                            );
                            final box = Boxes.getNames();
                            box.add(nameData);
                            await NameConfirmationPage().nameConfirmationDialog(context, player1, player2, player3, player4);
                          },
                          child: Text("Start", style: TextStyle(color: Colors.white),)),
                    )
                  ),
        
        
                ],
              );
          },
        
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RulesPage()),
                      );
                    }, child: Text("Rules",
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


  // Future<void> _showMyDialog(player1, player2, player3, player4) async{
  //   return showDialog(
  //       context: context,
  //       builder: (context){
  //         return AlertDialog(
  //           title: Center(child: Text('Confirmation')),
  //           content: SingleChildScrollView(
  //             child: Column(
  //               children: [
  //                 Text("Players names are:", style: TextStyle(fontWeight: FontWeight.bold),),
  //                 Text("1. "+player1),
  //                 Text("2. "+player2),
  //                 Text("3. "+player3),
  //                 Text("4. "+player4),
  //
  //               ],
  //             ),
  //           ),
  //           actions: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 SizedBox(
  //                   height: 50,
  //                   width: 100,
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(3),
  //                     child: ElevatedButton(
  //                       style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
  //                       onPressed: () async {
  //                         final box = Boxes.getNames();
  //                         await box.clear();
  //                         Navigator.pop(context);
  //                       },
  //                       child: Text('No', style: TextStyle(color: Colors.white, fontSize: 18),),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(width: 20,),
  //                 SizedBox(
  //                   height: 50,
  //                   width: 100,
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(3),
  //                     child: ElevatedButton(
  //                       style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade500),
  //                       onPressed: () {
  //                         Navigator.pushReplacement(
  //                           context,
  //                           MaterialPageRoute(
  //                               builder: (context) => const ScorePage(
  //                               )
  //                           ),
  //                         );
  //                       },
  //                       child: Text('Yes', style: TextStyle(color: Colors.white, fontSize: 18),),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //
  //           ],
  //
  //     );
  //   });
  // }

  Future<void> _sameNameErrorDialog(){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
              title: Center(child: Text('Error')),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Players can't have the same name."),
                  ],
                ),
              ),
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
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade500),
                            onPressed: () async{
                              Navigator.pop(context);
                            },
                            child: Text('Ok', style: TextStyle(color: Colors.white, fontSize: 18),)
                        ),
                      ),
                    ),
                  ],
                ),
            ]
          );
        }
    );
  }

  Future<void> _emptyDialog(){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
              title: Center(child: Text('Error')),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Please add the names of each player."),
                  ],
                ),
              ),
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
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade500),
                            onPressed: () async{
                              Navigator.pop(context);
                            },
                            child: Text('Ok', style: TextStyle(color: Colors.white, fontSize: 18),)
                        ),
                      ),
                    ),
                  ],
                ),
              ]
          );
        }
    );
  }

  // Future<void> _showExitConfirmationDialog() async {
  //   _willExitApp = true; // Set flag to prevent immediate exit
  //   return showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Center(child: Text('Exit Game', style: TextStyle(fontSize: 18),)),
  //       content: Text('Are you sure you want to exit the game?'),
  //       actions: [
  //
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             SizedBox(
  //               height: 50,
  //               width: 100,
  //               child: Padding(
  //                 padding: const EdgeInsets.all(3),
  //                 child: ElevatedButton(
  //                   style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
  //                   onPressed: () {
  //                     Navigator.pop(context); // Cancel exit
  //                     _willExitApp = false; // Reset flag
  //                   },
  //                   child: Text('No', style: TextStyle(color: Colors.white, fontSize: 18),),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(width: 20,),
  //             SizedBox(
  //               height: 50,
  //               width: 100,
  //               child: Padding(
  //                 padding: const EdgeInsets.all(3),
  //                 child: ElevatedButton(
  //                   style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade500),
  //                   onPressed: () {
  //                     SystemNavigator.pop(); // Exit the app
  //                   },
  //                   child: Text('Yes', style: TextStyle(color: Colors.white, fontSize: 18),),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }


}
