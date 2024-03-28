import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Hazari/boxes/boxes.dart';
import 'package:Hazari/pages/about_us.dart';
import 'package:Hazari/pages/history_page.dart';
import 'package:Hazari/pages/rules_page.dart';
import 'package:Hazari/models/name_score_model.dart';
import 'package:Hazari/pages/score_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Hazari/widgets/exit_confirmation_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  late Box namesBox;
  late Box scoreBox;

  final player1Controller = TextEditingController();
  final player2Controller = TextEditingController();
  final player3Controller = TextEditingController();
  final player4Controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    namesBox = Boxes.getNames();
    namesBox.clear();
    scoreBox = Boxes.getScores();
    scoreBox.clear();// Clear the box's data
  }

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
              'হাজারি',
              style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,),
            ),
            Spacer(),
            Row(
              children: [
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => AboutUsPage()),
                //     );
                //   },
                //   child: Text(
                //     "আমাদের সম্পর্কে",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 16,
                //       fontWeight: FontWeight.w400,
                //     ),
                //   ),
                // ),
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
        child: SafeArea(
          child: ValueListenableBuilder<Box<NameModel>>(
            valueListenable: Boxes.getNames().listenable(),
            builder: (context, box, _) {
              var nameData = box.values.toList().cast<NameModel>();
              return ListView(
                children: [
                  SizedBox(height: 10,),
                  Center(
                    child: Text(
                        "খেলোয়াড়দের নাম",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: TextField(
                        controller: player1Controller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "১ম খেলোয়াড় - ডিলার",
                          counterText: "",
                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
                        maxLength: 8,
                      )
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: TextField(
                        controller: player2Controller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "২য় খেলোয়াড়",
                          counterText: "",
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
                        maxLength: 8,
                      )
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: TextField(
                        controller: player3Controller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "৩য় খেলোয়াড়",
                          counterText: "",
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
                        maxLength: 8,
                      )
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: TextField(
                        controller: player4Controller,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "৪র্থ খেলোয়াড়",
                          counterText: "",
                            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
                        maxLength: 8,
                      )
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 3),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () async{
                            final player1 = player1Controller.text;
                            final player2 = player2Controller.text;
                            final player3 = player3Controller.text;
                            final player4 = player4Controller.text;

                            if (player1.isEmpty || player2.isEmpty || player3.isEmpty || player4.isEmpty) {
                              _emptyDialog();
                              return; // Prevent saving and showing the dialog
                            }

                            // Check for duplicate names
                            if (player1 == player2 ||
                                player1 == player3 ||
                                player1 == player4 ||
                                player2 == player3 ||
                                player2 == player4 ||
                                player3 == player4) {
                              _sameNameErrorDialog();
                              return; // Prevent saving and showing the dialog
                            }

                            final nameData = NameModel(
                                player1: player1Controller.text,
                                player2: player2Controller.text,
                                player3: player3Controller.text,
                                player4: player4Controller.text
                            );
                            final box = Boxes.getNames();
                            box.add(nameData);
                            await Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ScorePage(
                                  )
                              ),
                            );
                          },
                          child: Text("শুরু করুন", style: TextStyle(color: Colors.white),)),
                    )
                  ),
        
        
                ],
              );
          },
        
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
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => HistoryPage(),
                        ),
                      );
                    }, child: Text("ইতিহাস",
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


  // Future<void> _showMyDialog(player1, player2, player3, player4) async{
  //   return showDialog(
  //       context: context,
  //       builder: (context){
  //         return AlertDialog(
  //           title: Center(child: Text('Confirmation')),
  //           content: SingleChildScrollView(
  //             child: Column(
  //               children: [
  //                 Text("Players names are:", style: TextStyle(fontWeight: FontWeight.bold),),
  //                 Text("1. "+player1),
  //                 Text("2. "+player2),
  //                 Text("3. "+player3),
  //                 Text("4. "+player4),
  //
  //               ],
  //             ),
  //           ),
  //           actions: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 SizedBox(
  //                   height: 50,
  //                   width: 100,
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(3),
  //                     child: ElevatedButton(
  //                       style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
  //                       onPressed: () async {
  //                         final box = Boxes.getNames();
  //                         await box.clear();
  //                         Navigator.pop(context);
  //                       },
  //                       child: Text('No', style: TextStyle(color: Colors.white, fontSize: 18),),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(width: 20,),
  //                 SizedBox(
  //                   height: 50,
  //                   width: 100,
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(3),
  //                     child: ElevatedButton(
  //                       style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade500),
  //                       onPressed: () {
  //                         Navigator.pushReplacement(
  //                           context,
  //                           MaterialPageRoute(
  //                               builder: (context) => const ScorePage(
  //                               )
  //                           ),
  //                         );
  //                       },
  //                       child: Text('Yes', style: TextStyle(color: Colors.white, fontSize: 18),),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //
  //           ],
  //
  //     );
  //   });
  // }

  Future<void> _sameNameErrorDialog(){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
              title: Center(child: Text('ত্রুটি')),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("খেলোয়াড়দের একই নাম থাকতে পারবে না।"),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade500),
                            onPressed: () async{
                              Navigator.pop(context);
                            },
                            child: Text('ঠিক আছে', style: TextStyle(color: Colors.white, fontSize: 18),)
                        ),
                      ),
                    ),
                  ],
                ),
            ]
          );
        }
    );
  }

  Future<void> _emptyDialog(){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
              title: Center(child: Text('ত্রুটি')),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("প্রতিটি খেলোয়াড়ের নাম যোগ করুন."),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade500),
                            onPressed: () async{
                              Navigator.pop(context);
                            },
                            child: Text('ঠিক আছে', style: TextStyle(color: Colors.white, fontSize: 18),)
                        ),
                      ),
                    ),
                  ],
                ),
              ]
          );
        }
    );
  }


}
