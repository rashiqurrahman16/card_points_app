

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hazari"),
        toolbarHeight: 200,

        centerTitle: true,
        backgroundColor: Colors.blue,

      ),

      body: SafeArea(
        child: ValueListenableBuilder<Box<ScoreModel>>(
          valueListenable: Boxes.getScores().listenable(),
          builder: (context, box, _){
            var scoreData = box.values.toList().cast<ScoreModel>();

            return ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: score1Controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: score2Controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: score3Controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: score4Controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                  ),
                )
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

            // if (int.parse(score1)+int.parse(score2)+int.parse(score3)+int.parse(score4)==360) {
            //   //---------- for test purpose only
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     SnackBar(
            //       content: Text('Action completed!'), // Customize the message here
            //       action: SnackBarAction(
            //         label: 'Undo', // Optional action button
            //         onPressed: () {
            //           // Perform undo action here
            //         },
            //       ),
            //     ),
            //   );
            //   //----------
            //   return; // Prevent saving and showing the dialog
            // }





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


