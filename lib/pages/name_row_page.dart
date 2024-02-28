


import 'package:flutter/material.dart';


class NameRow extends StatelessWidget {
  final String player1;
  final String player2;
  final String player3;
  final String player4;

  const NameRow({
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
                  color: Colors.grey,
                  border: Border.all(
                      width: 2, color: Colors.white),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(10))
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text(player1, style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),),

            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                      width: 2, color: Colors.white),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(10))
              ),
              alignment: Alignment.center,

              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text(player2, style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                      width: 2, color: Colors.white),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(10))
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text(player3, style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                      width: 2, color: Colors.white),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(10))
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: screenSize.width / 4,
              child: Text(player4, style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),),
            ),


          ],
        ),

      ],
    );
  }
}
