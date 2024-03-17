import 'package:flutter/material.dart';
import '../boxes/boxes.dart';
import '../pages/score_page.dart';



class NameConfirmationPage{
  Future<void> nameConfirmationDialog(BuildContext context, player1, player2, player3, player4) async{
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Center(child: Text('Confirmation')),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Players names are:", style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("1. "+player1),
                  Text("2. "+player2),
                  Text("3. "+player3),
                  Text("4. "+player4),

                ],
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 90,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
                        onPressed: () async {
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
                    width: 90,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
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
}