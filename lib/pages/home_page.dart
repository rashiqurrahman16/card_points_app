import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hazari/boxes/boxes.dart';
import 'package:hazari/pages/score_page.dart';
import 'package:hazari/models/name_score_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _willExitApp = false;

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


      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop){
          if (didPop) {
          return; // Allow exiting the app
          }
          else {
            _showExitConfirmationDialog();
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
                            border: OutlineInputBorder(),
                            labelText: "Player 1",
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
                            _showMyDialog(player1, player2, player3, player4);
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


  Future<void> _showMyDialog(player1, player2, player3, player4) async{
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Center(child: Text('Confirmation')),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Players names are:"),
                  Text(player1),
                  Text(player2),
                  Text(player3),
                  Text(player4),
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
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
                        onPressed: () async {
                          player1Controller.clear();
                          player2Controller.clear();
                          player3Controller.clear();
                          player4Controller.clear();

                          final box = Boxes.getNames();
                          await box.clear();
                          Navigator.pop(context);
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ScorePage(
                                )
                            ),
                          );
                        },
                        child: Text('Yes', style: TextStyle(color: Colors.white, fontSize: 18),),
                      ),
                    ),
                  ),
                ],
              ),

            ],

      );
    });
  }

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

  Future<void> _showExitConfirmationDialog() async {
    _willExitApp = true; // Set flag to prevent immediate exit
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
                      _willExitApp = false; // Reset flag
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
