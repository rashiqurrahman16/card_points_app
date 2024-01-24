import 'package:flutter/material.dart';
import 'package:hazari/pages/player_name_page.dart';
import 'package:hazari/pages/score_page.dart';
import 'package:hazari/pages/point_add_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hazari App',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: true,
      home: const PlayerNamePage(),
      // home: const ScorePage(),
      // home: const PiontAddPage(),
    );
  }
}




