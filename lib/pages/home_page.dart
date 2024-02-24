import 'package:flutter/material.dart';
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

  final player1Controller = TextEditingController();
  final player2Controller = TextEditingController();
  final player3Controller = TextEditingController();
  final player4Controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Row(
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


      body: SafeArea(
        child: ValueListenableBuilder<Box<NameModel>>(
          valueListenable: Boxes.getNames().listenable(),
          builder: (context, box, _) {
            var nameData = box.values.toList().cast<NameModel>();
            return ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: TextField(
                      controller: player1Controller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Player 1"),
                      maxLength: 5,
                    )
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: TextField(
                      controller: player2Controller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Player 2"),
                      maxLength: 5,
                    )
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: TextField(
                      controller: player3Controller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Player 3"),
                      maxLength: 5,
                    )
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: TextField(
                      controller: player4Controller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Player 4"),
                      maxLength: 5,
                    )
                ),


              ],
            );
        },

        ),

      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 64,
        width: 64,
        child: FloatingActionButton(
          elevation: 10,

          child: Text('Done'),
          backgroundColor: Colors.blue,
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


  Future<void> _showMyDialog(player1, player2, player3, player4) async{


    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Confirmation'),
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
              TextButton(
                  onPressed: () async{
                    player1Controller.clear();
                    player2Controller.clear();
                    player3Controller.clear();
                    player4Controller.clear();

                    final box = Boxes.getNames();
                    await box.clear();

                    Navigator.pop(context);

                  },
                  child: Text('No')
              ),

              TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScorePage(
                          )
                      ),
                    );
                  },
                  child: Text('Yes')
              )
            ],

      );
    });
  }

  Future<void> _sameNameErrorDialog(){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
              title: Text('Error'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Players can't have same name"),
                  ],
                ),
              ),
              actions: [
              TextButton(
              onPressed: () async{
                Navigator.pop(context);
              },
                  child: Text('Ok')
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
              title: Text('Error'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Please enter every players name"),
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () async{
                      Navigator.pop(context);
                    },
                    child: Text('Ok')
                ),
              ]
          );
        }
    );
  }


}
