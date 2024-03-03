import 'package:flutter/material.dart';
import 'package:hazari/boxes/boxes.dart';
import 'package:hazari/pages/home_page.dart';
import 'package:hazari/pages/score_page.dart';
import 'package:hazari/models/name_score_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';



class WinnerPage extends StatefulWidget {
  const WinnerPage({super.key});

  @override
  State<WinnerPage> createState() => _WinnerPageState();
}

class _WinnerPageState extends State<WinnerPage> {

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Row(
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
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Spacer(),
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Image(
                image: AssetImage('assets/Desktopit-logo.png'),
              ),
            ),
          ],
        ),
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),


      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ensure content fits within screen
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40), // Add padding around text
              decoration: BoxDecoration(
                color: Colors.blue, // Set background color
                borderRadius: BorderRadius.circular(10.0), // Add rounded corners
              ),
              child: Column(
                children: [
                  Text(
                    'Winner',
                    style: TextStyle(
                      color: Colors.white, // Set text color for contrast
                      fontSize: 40.0, // Adjust font size as needed
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'ABCD',
                        style: TextStyle(
                          color: Colors.white, // Set text color for contrast
                          fontSize: 20.0, // Adjust font size as needed
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        '1000 pts',
                        style: TextStyle(
                          color: Colors.white, // Set text color for contrast
                          fontSize: 20.0, // Adjust font size as needed
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),


                ],
              ),

            ),
          ],
        ),
      ),



      bottomNavigationBar: BottomAppBar(

        color: Colors.blue,
        shape: const CircularNotchedRectangle(),
      ),
    );
  }





}