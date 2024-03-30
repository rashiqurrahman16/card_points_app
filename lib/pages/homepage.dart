import 'package:Card_Points/call_bridge_pages/call_bridge_homepage.dart';
import 'package:Card_Points/hazari_pages/hazari_homepage.dart';
import 'package:Card_Points/pages/about_us.dart';
import 'package:Card_Points/pages/rules_page.dart';
import 'package:Card_Points/widgets/exit_confirmation_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                width: 35.0,
                height: 35.0,
                child: Image(
                  image: AssetImage('assets/only_cards.png'),
                ),
              ),
              SizedBox(width: 5),
              Text(
                'কার্ড পয়েন্টস',
                style: TextStyle(color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,),
              ),
              Spacer(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUsPage()),
                      );
                    },
                    child:  SizedBox(
                      width: 35.0,
                      height: 35.0,
                      child: Image(
                        image: AssetImage('assets/Logo.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          toolbarHeight: 80,
          centerTitle: true,
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
        ),


        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop){
            if (didPop) {
              return; // Allow exiting the app
            }
            else {
              ExitConfirmationPage().showExitConfirmationDialog(context);
              return; // Prevent immediate exit
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HazariHomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Colors.blue.shade600,  // Set border color to white
                          width: 2.0,           // Adjust border width as desired
                        ),
                      ),
                    ),

                    child: Text('হাজারি', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),),
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CallBridgeHomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Colors.blue.shade600,  // Set border color to white
                          width: 2.0,           // Adjust border width as desired
                        ),
                      ),
                    ),

                      child: Text('কল ব্রিজ', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),),
                  ),
                ),
              ],
            ),
          ),
        ),


        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          shape: const CircularNotchedRectangle(),
          child: Container(
            alignment: Alignment.center,
            height: 10,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Colors.blue.shade600,  // Set border color to white
                          width: 2.0,           // Adjust border width as desired
                        ),
                      ),
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RulesPage()),
                      );
                    }, child: Text("নিয়ম",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Colors.blue.shade600,  // Set border color to white
                          width: 2.0,           // Adjust border width as desired
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await ExitConfirmationPage().showExitConfirmationDialog(context);
                    }, child: Text("বাহির",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )),
              ],
            ),

          ),
        )
    );
  }
}
