import 'package:flutter/material.dart';
import 'package:hazari/pages/score_page.dart';

import '../boxes/boxes.dart';
import '../models/name_score_model.dart';

class PiontAddPage extends StatefulWidget {
  const PiontAddPage({super.key});

  @override
  State<PiontAddPage> createState() => _PiontAddPageState();
}

class _PiontAddPageState extends State<PiontAddPage> {





  final score1Controller = TextEditingController();
  final score2Controller = TextEditingController();
  final score3Controller = TextEditingController();
  final score4Controller = TextEditingController();


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
//TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Pts"),),
      body: Container(
        // alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Text("Player1", style: TextStyle(color: Colors.blue),),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller: score1Controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Text("Player1", style: TextStyle(color: Colors.blue),),
                      SizedBox(
                        width: 150,
                        child: TextField(
                          controller: score2Controller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              ),
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                        )
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("Player1", style: TextStyle(color: Colors.blue),),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: score3Controller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                      )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Player1", style: TextStyle(color: Colors.blue),),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: score4Controller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                      )
                    ),
                  ],
                ),


              ],
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

          child: Text('Done'),
          backgroundColor: Colors.blue,
          onPressed: () async{
            final score1 = score1Controller.text;
            final score2 = score2Controller.text;
            final score3 = score3Controller.text;
            final score4 = score4Controller.text;

            if (score1.isEmpty || score2.isEmpty || score3.isEmpty || score4.isEmpty) {
              _emptyDialog();
              return; // Prevent saving and showing the dialog
            }


            final data = ScoreModel(
                score1: int.parse(score1Controller.text),
                score2: int.parse(score2Controller.text),
                score3: int.parse(score3Controller.text),
                score4: int.parse(score4Controller.text)
            );



            final box = Boxes.getScores();
            box.add(data);

            _showMyDialog();
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

  Future<void> _showMyDialog() async{


    // Access the scores box
    final scoresBox = Boxes.getScores();

    // Print all scores to the console
    print("All scores in the box:");
    print(scoresBox.values.toList());

    return showDialog(

        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Success'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Points Successfuly Added"),

                ],
              ),
            ),

          );
        });
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
                    Text("Please enter points for every players"),
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


  Future<void> _pointsErrorDialog(){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
              title: Text('Error'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Sum of all four points must be 360"),
                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () async{
                      score1Controller.clear();
                      score2Controller.clear();
                      score3Controller.clear();
                      score4Controller.clear();
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
