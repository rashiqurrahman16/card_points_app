
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NameRow extends StatelessWidget {
  final int dealer;
  final String player1;
  final String player2;
  final String player3;
  final String player4;

  const NameRow({
    required this.dealer,
    required this.player1,
    required this.player2,
    required this.player3,
    required this.player4,
    super.key
  });



  @override
  Widget build(BuildContext context) {

    final screenSize=MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20,
              width: screenSize.width/4,
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10), bottom: Radius.zero),
                border: Border.symmetric(
                  vertical: BorderSide(width: 1, color: Colors.orange.shade200),
                ),
              ),
              child:  dealer==1 ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.front_hand, size: 13,),
                  SizedBox(width: 5,),
                  Text("dealer",style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic),),
                ],
              )
                  : Text(""),
            ),
            Container(
              height: 20,
              width: screenSize.width/4,
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10), bottom: Radius.zero),
                border: Border.symmetric(
                  vertical: BorderSide(width: 1, color: Colors.orange.shade200),
                ),
              ),
              child:  dealer==2 ? const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.front_hand, size: 13,),
                  SizedBox(width: 5,),
                  Text("dealer",style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic),),
                ],
              )
                  : Text(""),
            ),
            Container(
              height: 20,
              width: screenSize.width/4,
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10), bottom: Radius.zero),
                border: Border.symmetric(
                  vertical: BorderSide(width: 1, color: Colors.orange.shade200),
                ),
              ),
              child:  dealer==3 ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.front_hand, size: 13,),
                  SizedBox(width: 5,),
                  Text("dealer",style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic),),
                ],
              )
                  : Text(""),
            ),
            Container(
              height: 20,
              width: screenSize.width/4,
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10), bottom: Radius.zero),
                border: Border.symmetric(
                  vertical: BorderSide(width: 1, color: Colors.orange.shade200),
                ),
              ),
              child:  dealer==4 ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.front_hand, size: 13,),
                  SizedBox(width: 5,),
                  Text("dealer",style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic),),
                ],
              )
                  : Text(""),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  borderRadius: BorderRadius.vertical(top: Radius.zero, bottom: Radius.circular(10)),
                  border: Border.symmetric(
                    vertical: BorderSide(width: 1, color: Colors.orange.shade500),
                  ),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text(player1, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,),),

            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.orange.shade400,
                borderRadius: BorderRadius.vertical(top: Radius.zero, bottom: Radius.circular(10)),
                border: Border.symmetric(
                  vertical: BorderSide(width: 1, color: Colors.orange.shade500),
                ),
              ),
              alignment: Alignment.center,

              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text(player2, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,),),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.orange.shade400,
                borderRadius: BorderRadius.vertical(top: Radius.zero, bottom: Radius.circular(10)),
                border: Border.symmetric(
                  vertical: BorderSide(width: 1, color: Colors.orange.shade500),
                ),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text(player3, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,),),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.orange.shade400,
                borderRadius: BorderRadius.vertical(top: Radius.zero, bottom: Radius.circular(10)),
                border: Border.symmetric(
                  vertical: BorderSide(width: 1, color: Colors.orange.shade500),
                ),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text(player4, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,),),
            ),


          ],
        ),


      ],
    );
  }
}
