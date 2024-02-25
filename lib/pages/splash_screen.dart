import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hazari/pages/home_page.dart';


class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage(),));
    }
    );
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;

    return const Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage('assets/3cards.png'),
                height: 120,
                width: 120,
              ),
              SizedBox(width: 10,),
              Text("HAZARI", style: TextStyle(fontWeight: FontWeight.w900),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image(
                image: AssetImage('assets/Desktopit-logo.png'),
                height: 120,
                width: 120,
              ),

            ],
          ),
        ],
      ),
    );
  }

}
