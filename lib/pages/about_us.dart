import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';


class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            SizedBox(
              width: 35.0,
              height: 35.0,
              child: Image(
                image: AssetImage('assets/3cards.png'),
              ),
            ),
            Text(
              'HAZARI',
              style: TextStyle(color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,),
            ),
            Spacer(),
            Row(
              children: [
                Text("Who We Are", style: TextStyle(color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,),),
                SizedBox(
                  width: 35.0,
                  height: 35.0,
                  child: Image(
                    image: AssetImage('assets/Logo.png'),
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

        body: SafeArea(
            child: ListView(
              children: [
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 50,),
                  SizedBox(
                    height: 120,
                    width: 800,
                    child: Image(
                      image: AssetImage('assets/Desktopit-logo.png'),
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width*0.8,
                      child: Text('Desktop IT is a leading solution provider for Internet-based applications. '
                          'Established in 1995, The Company has been promoted by some highly experienced Professionals dedicated to provide total IT solutions under one roof. '
                          'It possesses not only the latest technology gadgets but also the most knowledgeable and experienced hands to offer the most user-friendly customized solutions.',
                      style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: screenSize.width*0.8,
                    child: Center(
                      child: Text('Contact Us: +880 1913 800800',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width*0.8,
                    child: Center(
                      child: Text('Email: info@desktopit.com.bd',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width*0.8,
                    child: Center(
                      child: Text('Address: 147/C, Greenroad, Dhaka-1205',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150.0,
                    height: 100.0,
                    child: Image(
                      image: AssetImage('assets/Gplay.png'),
                    ),
                  ),


                ],
              ),]
            )
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
                    onPressed: () => Navigator.pop(context),
                    child: Text("Back",
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
                    onPressed: (){
                      _showExitConfirmationDialog(context);
                    }, child: Text("Exit Game",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )),
              ],
            ),

          ),
        )

    );
  }
  Future<void> _showExitConfirmationDialog(BuildContext context) async {
    // Set flag to prevent immediate exit
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: Text('Exit Game', style: TextStyle(fontSize: 18),)),
        content: Text('Are you sure you want to exit the game?'),
        actions: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
                    onPressed: () {
                      Navigator.pop(context); // Cancel exit
                    },
                    child: Text('No', style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              SizedBox(
                height: 50,
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade500),
                    onPressed: () {
                      SystemNavigator.pop(); // Exit the app
                    },
                    child: Text('Yes', style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
