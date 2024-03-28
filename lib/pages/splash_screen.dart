import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:Hazari/pages/home_page.dart';


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
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage('assets/only_cards.png'),
                height: 140,
              ),
              SizedBox(width: 10,),

              Text("হাজারি", style: TextStyle(
                  color: Colors.yellow.shade700,
                  fontSize: 30,
                  fontWeight: FontWeight.w900),),
            ],
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.blue.shade50,
        child: Container(
          alignment: Alignment.center,
          height: 10,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Developed By", style: TextStyle(fontWeight: FontWeight.w600),),
              Image(
                image: AssetImage('assets/Logo.png'),
                height: 35,
              ),
            ],
          ),

        ),
      ),
    );
  }

}
