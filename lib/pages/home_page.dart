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

  String player1 = "";
  String player2 = "";
  String player3 = "";
  String player4 = "";

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hazari'),
        toolbarHeight: 200,

        centerTitle: true,
        backgroundColor: Colors.blue,
      ),


      body: SafeArea(
        child: ValueListenableBuilder<Box<NameModel>>(
          valueListenable: Boxes.getNames().listenable(),
          builder: (context, box, _) {
            var data = box.values.toList().cast<NameModel>();
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: TextField(
                      controller: player1Controller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Player 1"),
                    )
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: TextField(
                      controller: player2Controller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Player 2"),
                    )
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: TextField(
                      controller: player3Controller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Player 3"),
                    )
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: TextField(
                      controller: player4Controller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Player 4"),
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
            final data = NameModel(
                player1: player1Controller.text,
                player2: player1Controller.text,
                player3: player1Controller.text,
                player4: player1Controller.text
            );
            final box = Boxes.getNames();
            box.add(data);
            _showMyDialog(data, player1, player2, player3, player4);
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


  Future<void> _showMyDialog(NameModel nameModel, player1, player2, player3, player4) async{

    player1Controller.text = player1;
    player2Controller.text = player2;
    player3Controller.text = player3;
    player4Controller.text = player4;
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Confirmation'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Players names are:"),
                  Text(player1Controller.text),
                  Text("player2Controller.text"),
                  Text("player3Controller.text"),
                  Text("player4Controller.text"),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    player1Controller.clear();
                    player2Controller.clear();
                    player3Controller.clear();
                    player4Controller.clear();
                    Navigator.pop(context);
                  },
                  child: Text('No')
              ),

              TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScorePage(
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


}
