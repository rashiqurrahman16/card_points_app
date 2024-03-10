
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
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                  border: dealer==1 ? Border(
                    top: BorderSide(width: 1, color: Colors.white),
                    right: BorderSide(width: 1, color: Colors.white),
                    left: BorderSide(width: 1, color: Colors.white),
                    bottom: BorderSide(width: 5, color: Colors.black),
                  ):Border.all(
                      width: 1, color: Colors.white),
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
                border: dealer==2 ? Border(
                  top: BorderSide(width: 1, color: Colors.white),
                  right: BorderSide(width: 1, color: Colors.white),
                  left: BorderSide(width: 1, color: Colors.white),
                  bottom: BorderSide(width: 5, color: Colors.black),
                ):Border.all(
                    width: 1, color: Colors.white),
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
                border: dealer==3 ? Border(
                  top: BorderSide(width: 1, color: Colors.white),
                  right: BorderSide(width: 1, color: Colors.white),
                  left: BorderSide(width: 1, color: Colors.white),
                  bottom: BorderSide(width: 5, color: Colors.black),
                ):Border.all(
                    width: 1, color: Colors.white),
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
                border: dealer==4 ? Border(
                  top: BorderSide(width: 1, color: Colors.white),
                  right: BorderSide(width: 1, color: Colors.white),
                  left: BorderSide(width: 1, color: Colors.white),
                  bottom: BorderSide(width: 5, color: Colors.black),
                ):Border.all(
                    width: 1, color: Colors.white),
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
