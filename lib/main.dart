import 'package:flutter/material.dart';
import 'package:hazari/pages/home_page.dart';
import 'package:hazari/pages/splash_screen.dart';
import 'package:hazari/pages/winner_page.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hazari/models/name_score_model.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(NameModelAdapter());

  await Hive.openBox<NameModel>('names');

  Hive.registerAdapter(ScoreModelAdapter());

  await Hive.openBox<ScoreModel>('scores');


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
      home: const WinnerPage(),
    );
  }
}




