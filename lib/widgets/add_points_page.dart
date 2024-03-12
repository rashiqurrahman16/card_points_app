

import 'package:flutter/material.dart';
import 'package:hazari/models/name_score_model.dart';
import 'package:hazari/pages/score_page.dart';
import '../boxes/boxes.dart';



class AddPointsPage extends StatefulWidget {
  const AddPointsPage({super.key});



  @override
  State<AddPointsPage> createState() => _AddPointsPageState();
}

class _AddPointsPageState extends State<AddPointsPage> {

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

    return SafeArea(
      child: ListView(
        children: [
          AlertDialog(

            title: Center(child: Text("Add Points", style: TextStyle(fontSize: 20),)),


            content: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min
                ,
                children: [
                  Text("(Sum of all Points must be 360)", style: TextStyle(fontSize: 13),),
                  SizedBox(height: 5,),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          player1,
                          style: const TextStyle(
                            fontSize: 18,
                          ),

                        ),
                        const SizedBox(width: 10,),
                        SizedBox(
                          width: screenSize.width/4,
                          child: TextField(
                            controller: score1Controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              counterText: "",
                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          player2,
                          style: const TextStyle(
                            fontSize: 18,
                          ),

                        ),
                        const SizedBox(width: 10,),
                        SizedBox(
                          width: screenSize.width/4,
                          child: TextField(
                            controller: score2Controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              counterText: "",
                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          player3,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 10,),
                        SizedBox(
                          width: screenSize.width/4,
                          child: TextField(
                            controller: score3Controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              counterText: "",
                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          player4,
                          style: const TextStyle(
                            fontSize: 18,
                          ),

                        ),
                        const SizedBox(width: 10,),
                        SizedBox(
                          width: screenSize.width/4,
                          child: TextField(
                            controller: score4Controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              counterText: "",
                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            ),
                            maxLength: 3,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text("Cancel", style: TextStyle(color: Colors.white, fontSize: 18),)
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade500),
                              onPressed: (){
                                final score1 = score1Controller.text;
                                final score2 = score2Controller.text;
                                final score3 = score3Controller.text;
                                final score4 = score4Controller.text;


                                if (score1.isEmpty || score2.isEmpty || score3.isEmpty || score4.isEmpty){
                                  _errorPointsDialog(2);
                                  return;
                                }
                                if (int.parse(score1)+int.parse(score2)+int.parse(score3)+int.parse(score4)!=360) {
                                  _errorPointsDialog(1);
                                  return; // Prevent saving if total score is not equal to 360
                                }
                                if ((int.parse(score1)!=0 && int.parse(score1)<60) || (int.parse(score2)!=0 && int.parse(score2)<60)
                                    || (int.parse(score3)!=0 && int.parse(score3)<60) || (int.parse(score4)!=0 && int.parse(score4)<60)) {
                                  _errorPointsDialog(2);
                                  return; // Prevent saving and showing the dialog

                                }

                                if (int.parse(score1)%5!=0 || int.parse(score2)%5!=0 || int.parse(score3)%5!=0 || int.parse(score4)%5!=0) {
                                  _errorPointsDialog(3);
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

                                Navigator.of(context).popUntil((route) => route.isFirst);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ScorePage()),
                                );
                              }, child: Text("Submit", style: TextStyle(color: Colors.white, fontSize: 18),)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }



  _errorPointsDialog(int i){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Error'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  if(i==1)
                  Text('Sum of all players points must be equal to 360'),
                  if(i==2)
                  Text('No player can have less than 60 points'),
                  if(i==3)
                  Text('Must be able to divide by 5'),
                ],
              ),

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


