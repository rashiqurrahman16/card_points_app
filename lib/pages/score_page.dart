import 'package:flutter/material.dart';
import 'package:hazari/boxes/boxes.dart';
import 'package:hazari/pages/point_add_page.dart';
import 'package:hive/hive.dart';

import '../models/name_score_model.dart';

class ScorePage extends StatefulWidget {


  const ScorePage({
    super.key,
  });

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {


  String player1 = "";
  String player2 = "";
  String player3 = "";
  String player4 = "";

  @override
  void initState() {
    super.initState();
    _retrieveNames();
  }

  void _retrieveNames() async {
    final box = Boxes.getNames();
    final names = box.values.toList().cast<NameModel>();

    final nameData = names.last; // Assuming there's only one set of names
    setState(() {
      player1 = nameData.player1;
      player2 = nameData.player2;
      player3 = nameData.player3;
      player4 = nameData.player4;
    });
    print("Saved Names:");
    for (var name in names) {
      print("- Player 1: ${name.player1}, Player 2: ${name.player2}, Player 3: ${name.player3}, Player 4: ${name.player4}");
    }

  }


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

        child: Column(
          children: [
            Column(
              children: [
                Row(

                  children: [


                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          width: screenSize.width/4,
                          child: Text(player1, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          alignment: Alignment.center,

                          padding: EdgeInsets.all(5),
                          width: screenSize.width/4,
                          child: Text(player2, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          width: screenSize.width/4,
                          child: Text(player3, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          width: screenSize.width/4,
                          child: Text(player4, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                        ),


                  ],
                ),

              ],
            ),
            SizedBox(height: 10),



            Column(
              children: [
                Row(

                  children: [


                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          width: screenSize.width/4,
                          child: Text("150", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          alignment: Alignment.center,

                          padding: EdgeInsets.all(5),
                          width: screenSize.width/4,
                          child: Text("100", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          width: screenSize.width/4,
                          child: Text("50", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          width: screenSize.width/4,
                          child: Text("60", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
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
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PiontAddPage(
                  )
              ),
            );
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
        child: Container(
          alignment: Alignment.center,
          height: 10,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  color: Colors.white,
                  iconSize: 30,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  icon: Icon(Icons.minimize_rounded),
                  onPressed: (){},
              ),
              IconButton(
                color: Colors.white,
                iconSize: 30,
                padding: EdgeInsets.symmetric(horizontal: 40),
                icon: Icon(Icons.refresh),
                onPressed: (){},
              ),
            ],
          ),

        ),
      ),

    );
  }
}