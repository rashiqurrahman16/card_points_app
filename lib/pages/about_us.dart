import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Hazari/widgets/exit_confirmation_page.dart';


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
                image: AssetImage('assets/only_cards.png'),
              ),
            ),
            SizedBox(width: 5),
            Text(
              'হাজারি',
              style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,),
            ),
            Spacer(),
            Row(
              children: [
                // Text("Who We Are", style: TextStyle(color: Colors.white,
                //   fontSize: 16,
                //   fontWeight: FontWeight.w400,),),
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
                SizedBox(height: 10,),
                Container(
                  width: screenSize.width*0.80,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        child: Image(
                          image: AssetImage('assets/only_cards.png'),
                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: screenSize.width*0.8,
                        child: Column(
                          children: [
                            Text("হাজারি", style: TextStyle(fontSize: 14),),
                            Text("ভার্সনঃ ১.০.০", style: TextStyle(fontSize: 14),),
                            Text("সর্বশেষ আপডেটঃ ২৮/০৩/২০২৪", style: TextStyle(fontSize: 14),),
                            SizedBox(height: 10,),
                            Text('হাজারি একটি জনপ্রিয় কার্ড গেম। ৪ জন খেলার এই অ্যাপে প্লেয়ারদের স্কোরবোর্ড পরিচালনা এবং পূর্ববর্তী খেলার স্কোরবোর্ড দেখতে পারবেন যা আপনাদের খেলাকে আরোও আনন্দদায়ক করে তুলবে। ',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.justify,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30,),

                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenSize.width*0.8,
                      child: Text('ডেস্কটপ আইটি তথ্য ও প্রযুক্তি সেবা প্রদানকারী বাংলাদেশের একটি শীর্ষস্থানীয় প্রতিষ্ঠান। '
                          'ডেস্কটপ আইটি অনলাইন সেবা ও ব্যবসা পরিধির বিস্তার ঘটানোর মাধ্যমে আইটি শিল্পে নিজেদের একটি শক্ত অবস্থান তৈরী করতে সক্ষম হয়েছে।',
                      style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: screenSize.width*0.8,
                    child: Center(
                      child: Text('কল করুন: +৮৮০ ১৯১৩ ৮০০৮০০',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width*0.8,
                    child: Center(
                      child: Text('ইমেল: info@desktopit.net',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width*0.8,
                    child: Center(
                      child: Text('ওয়েবসাইট: desktopit.net',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width*0.8,
                    child: Center(
                      child: Text('ঠিকানা: ১৪৭/সি, গ্রিনরোড, ঢাকা-১২০৫',
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
                    child: Text("পেছনে",
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
