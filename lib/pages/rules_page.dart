import 'package:flutter/material.dart';
import 'package:Card_Points/widgets/exit_confirmation_page.dart';
import 'about_us.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
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

        body: SafeArea(
            child: Center(
              child: SizedBox(
                width: screenSize.width*.90,
                child: ListView(
                  children: [
                    SizedBox(height: 40,),
                    Text("লক্ষ্যঃ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("সেই খেলোয়াড় হওয়া যে সবার আগে ১০০০ পয়েন্টস এ পৌছায়।", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),

                    SizedBox(height: 10,),
                    Text("কার্ডসঃ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("স্ট্যান্ডার্ড ড্যাক (৫২ কার্ডস)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),

                    SizedBox(height: 10,),
                    Text("সেটআপঃ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("১. গেমের শুরুতে খেলোয়াড় ১ কে ডিলার হিসেবে বাছাই করা হয়। এই ডিলারের দায়িত্ব প্রত্যেক রাউন্ড পর পর ক্লকওয়াইস নিয়মে পরের খেলোয়াড়ের কাছে যাবে।).", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("২. ডিলার কার্ডস শাফল (অদলবদল) করে এবং ৪ জন খেলোয়াড়ের মধ্যে ১৩টি করে কার্ডস বণ্টন করে।", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("৩. খেলোয়াড়রা কার্ডস গুলকে ৪ রকম সংমিশ্রণে সাজায় (প্রথম ৩ সংমিশ্রণে ৩টি করে কার্ডস, শেষ সংমিশ্রণে ৪টি করে কার্ডস)। সর্বশেষ সংমিশ্রণটি সব থেকে দুর্বল হতে হবে।", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("৪. খেলয়ারদের কার্ডস সাজানো হয়ে গেলে 'আপ' বলে।", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),

                    SizedBox(height: 10,),
                    Text("কার্ডস রেঙ্কিংঃ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("১. এস(উচ্চ),কিং,কুইন,জেক,১০,৯,৮,৭,৬,৫,৪,৩,২,১(নিম্ন)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("২. এস-১০ বাদে সকল কার্ডস ৫ পয়েন্টস", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("৩. প্রত্যেক রাউন্ড এর পয়েন্টসঃ ৩৬০", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),

                    SizedBox(height: 10,),
                    Text("সংমিশ্রণ (সর্বোচ্চ থেকে সর্বনিম্ন):", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("১. ট্রয়ঃ একই রেঙ্কের ৩ কার্ডস (উদাঃ ৩ কিংস)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("২. কালার রানঃ একই স্যুটের পরপর ৩টি কার্ড (উদাঃ স্পেডস এর A-K-Q)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("৩. রানঃ যেকোনো স্যুটের পরপর ৩টি কার্ড (উদাঃ 10-J-Q)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("৪. রঙঃ একই স্যুটের ৩টি কার্ড, পরপর নয় (সর্বোচ্চ কার্ড দ্বারা র‌্যাঙ্ক করা হয়েছে)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("৫. জোড়াঃ একই র‌্যাঙ্কের ২টি কার্ড + ১টি ভিন্ন কার্ড (জোড়ার মান অনুসারে র‌্যাঙ্ক করা হয়েছে)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("৬. ইন্ডিঃ ৩টি অতুলনীয় কার্ড (সর্বোচ্চ কার্ড দ্বারা র‍্যাঙ্ক করা হয়েছে)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),

                    SizedBox(height: 10,),
                    Text("গেমপ্লেঃ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("১. ডিলারের ডানদিকে প্লেয়ার শুরু হয়।", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("২. সমস্ত খেলোয়াড় বর্তমান রাউন্ডের জন্য তাদের সর্বোচ্চ র‌্যাঙ্কড কম্বিনেশন খেলে।", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("৩. সর্বোচ্চ সংমিশ্রণ সমস্ত খেলা কার্ড জিতে এবং পরবর্তী রাউন্ডে নেতৃত্ব দেয়।", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("৪. টাই হলে তা শেষ খেলোয়াড়দ্বারা ভেঙ্গে যায়।", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("৫. এটি সমস্ত ৪ সংমিশ্রণের জন্য পুনরাবৃত্তি করা হয়।", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),

                    SizedBox(height: 10,),
                    Text("স্কোরিংঃ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("১. সমস্ত সংমিশ্রণ খেলার পরে, খেলোয়াড়রা তাদের জয়ী কার্ড গুলোর (পয়েন্ট) স্কোর করে।", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("২. স্কোর রাউন্ড জুড়ে ক্রমবর্ধমান হয়.", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("৩. একটি রাউন্ড শেষে একজন খেলোয়াড় 1000 পয়েন্ট (বা তার বেশি) এ পৌঁছালে খেলা শেষ হয়।", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),

                    SizedBox(height: 10,),
                    Text("বিজয়ীঃ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("খেলা শেষে সর্বোচ্চ স্কোর করা খেলোয়াড় বিজয়ী হয়!", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    SizedBox(height: 40,),
                  ],
                ),
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
