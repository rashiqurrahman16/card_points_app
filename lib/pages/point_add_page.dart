

import 'package:flutter/material.dart';
import 'package:hazari/models/name_score_model.dart';
import 'package:hazari/pages/score_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../boxes/boxes.dart';



class PointAddPage extends StatefulWidget {
  const PointAddPage({super.key});



  @override
  State<PointAddPage> createState() => _PointAddPageState();
}

class _PointAddPageState extends State<PointAddPage> {

  final score1Controller = TextEditingController();
  final score2Controller = TextEditingController();
  final score3Controller = TextEditingController();
  final score4Controller = TextEditingController();



  String player1 = "";
  String player2 = "";
  String player3 = "";
  String player4 = "";

  @override
  void initState() {
    super.initState();
    _retrieveNamesScores();
  }

  void _retrieveNamesScores() async {
    final box1 = Boxes.getNames();
    final names = box1.values.toList().cast<NameModel>();
    final nameData = names.last; // Assuming there's only one set of names
    setState(() {
      player1 = nameData.player1;
      player2 = nameData.player2;
      player3 = nameData.player3;
      player4 = nameData.player4;
    });
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

      body: SafeArea(
        child: ValueListenableBuilder<Box<ScoreModel>>(
          valueListenable: Boxes.getScores().listenable(),
          builder: (context, box, _){
            var scoreData = box.values.toList().cast<ScoreModel>();

            return ListView(
              children: [
                const Center(
                child: Text(
                "Add Points",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                ),
                const SizedBox(height: 20,),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          player1,
                        style: const TextStyle(
                          fontSize: 20,
                        ),

                      ),
                      const SizedBox(width: 10,),
                      SizedBox(
                        width: 200,
                          child: TextField(
                            controller: score1Controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),

                            maxLength: 3,
                            keyboardType: TextInputType.number,
                          ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        player2,
                        style: const TextStyle(
                          fontSize: 20,
                        ),

                      ),
                      const SizedBox(width: 10,),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: score2Controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),

                          maxLength: 3,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        player3,
                        style: const TextStyle(
                          fontSize: 20,
                        ),

                      ),
                      const SizedBox(width: 10,),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: score3Controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),

                          maxLength: 3,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        player4,
                        style: const TextStyle(
                          fontSize: 20,
                        ),

                      ),
                      const SizedBox(width: 10,),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: score4Controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),

                          maxLength: 3,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
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
          backgroundColor: Colors.blue,
          onPressed: () {
            final score1 = score1Controller.text;
            final score2 = score2Controller.text;
            final score3 = score3Controller.text;
            final score4 = score4Controller.text;

            if (score1.isEmpty || score2.isEmpty || score3.isEmpty || score4.isEmpty) {
              _emptyPointsDialog();
              return; // Prevent saving and showing the dialog
            }

            if (int.parse(score1)+int.parse(score2)+int.parse(score3)+int.parse(score4)!=360) {
              _errorPointsDialog();
              return; // Prevent saving and showing the dialog
            }

            final scoreData = ScoreModel(
                score1: int.parse(score1Controller.text),
                score2: int.parse(score2Controller.text),
                score3: int.parse(score3Controller.text),
                score4: int.parse(score4Controller.text)
            );
            final box = Boxes.getScores();
            box.add(scoreData);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const ScorePage(
                  )
              ),
            );
          },

          shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: Colors.white, strokeAlign: BorderSide.strokeAlignOutside),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Text('Done'),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: const CircularNotchedRectangle(),

      ),




    );
  }

  _emptyPointsDialog(){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Error'),
            content: SingleChildScrollView(
              child: Text('Enter points for every players'),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              },
                  child:  Text('OK')
              )
            ],
          );
        }
    );
  }


  _errorPointsDialog(){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Error'),
            content: SingleChildScrollView(
              child: Text('Sum of all players points must be equal to 360'),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              },
                  child:  Text('OK')
              )
            ],
          );
        }
    );
  }




}


