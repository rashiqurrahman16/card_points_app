import 'package:flutter/material.dart';
import 'package:Card_Points/pages/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:Card_Points/models/name_score_model.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(NameModelAdapter());

  await Hive.openBox<NameModel>('names');

  Hive.registerAdapter(ScoreModelAdapter());

  await Hive.openBox<ScoreModel>('scores');

  Hive.registerAdapter(FinalScoreModelAdapter());

  await Hive.openBox<FinalScoreModel>('finalScores');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hazari App',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.blue.shade50,
        dialogTheme: DialogTheme(backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreenPage(),
    );
  }
}




