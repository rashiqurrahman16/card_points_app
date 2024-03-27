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
                      SizedBox(
                        width: screenSize.width*0.8,
                        child: Column(
                          children: [
                            Text("নামঃ হাজারি", style: TextStyle(fontSize: 14),),
                            Text("ভার্সনঃ ১.০.০", style: TextStyle(fontSize: 14),),
                            Text("শেষ আপডেটঃ ২৭/০৩/২০২৪", style: TextStyle(fontSize: 14),),
                            SizedBox(height: 10,),
                            Text("হাজারী হ'ল স্কোর ট্র্যাক করার এবং আনন্দদায়ক হাজারি কার্ড গেমে চূড়ান্ত বিজয়ী নির্ধারণের জন্য একটি গো-টু অ্যাপ৷ আপনি বন্ধু, পরিবার বা প্রতিপক্ষের সাথে খেলছেন না কেন, হাজারি স্কোরকিপিং প্রক্রিয়াটিকে সহজ করে তোলে, আপনাকে গেমের রোমাঞ্চের উপর ফোকাস করতে দেয়।",
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.justify,),
                            SizedBox(height: 10,),
                            Text("মূল বৈশিষ্ট্য:"),
                            Text("* হাজারি স্কোরকিপিং প্রক্রিয়াকে স্ট্রীমলাইন করে, যাতে খেলার অগ্রগতির সাথে সাথে খেলোয়াড়দের সহজেই তাদের স্কোর ইনপুট করতে পারে। স্বজ্ঞাত নিয়ন্ত্রণ এবং একটি ব্যবহারকারী-বান্ধব ইন্টারফেসের সাথে, রেকর্ডিং স্কোর কখনও সহজ ছিল না।",
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.justify,),
                            Text("* আপনি কাঙ্ক্ষিত ১০০০-পয়েন্ট থ্রেশহোল্ডে পৌঁছানোর লক্ষ্যে বিজয়ের দিকে আপনার দৃষ্টিভঙ্গি সেট করুন। একবার কোনো খেলোয়াড় বা দল এই মাইলফলক অতিক্রম করলে, হাজারী স্বয়ংক্রিয়ভাবে খেলা শেষ করে এবং চ্যাম্পিয়ন ঘোষণা করে।",
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.justify,),
                            Text("* মম্যানুয়াল স্কোর গণনা এবং বিভ্রান্তি বিদায় বলুন. হাজারী দ্রুত বিজয়ী নির্ধারণ করেন জমাকৃত স্কোরের ভিত্তিতে, বিজয়ী খেলোয়াড় বা দলের জন্য তাৎক্ষণিক তৃপ্তি এবং স্বীকৃতি প্রদান করে।",
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.justify,),

                          ],
                        ),
                      )

                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  height: 2,
                  width: screenSize.width,
                  color: Colors.black,
                ),
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120,
                    // width: 800,
                    child: Image(
                      image: AssetImage('assets/Desktopit-logo.png'),
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width*0.8,
                      child: Text('ডেস্কটপ আইটি তথ্য ও প্রযুক্তি সেবা প্রদানকারী বাংলাদেশের একটি শীর্ষস্থানীয় প্রতিষ্ঠান। ১৯৯৫ সালে প্রতিষ্ঠিত হওয়ার পর থেকে, এই কোম্পানি অভিজ্ঞ, পেশাদার এবং যোগ্য ব্যাক্তিদের দ্বারা দেশের বিভিন্ন সরকারী ও বেসরকারী প্রতিষ্ঠানে আইটি সেবা দিয়ে আসছে।আমরা আধুনিক টেকনলোজি এবং উন্নত গ্যাজেট গুলির মাধ্যমে দক্ষ এবং অভিজ্ঞ ব্যক্তিদের দ্বারা সকল প্রকার আইটি সমস্যার সমাধান দিতে সর্বদা প্রস্তত। '
                          'ডেস্কটপ আইটি মান সম্পন্ন অনসাইট সেবা প্রদান করে যাচ্ছে, যাতে ইউজাররা সহজে ব্যবহার করতে পারে। বর্তমান সময়ে ডেস্কটপ আইটি বেশ কিছু বড় প্রকল্প হাতে নিয়ে নিজেদের ব্যবসা পরিধির বিস্তার ঘটানোর মাধ্যমে আইটি শিল্পে নিজেদের একটি শক্ত অবস্থান তৈরী করতে সক্ষম হয়েছে।',
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
