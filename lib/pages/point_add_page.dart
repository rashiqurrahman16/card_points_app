import 'package:flutter/material.dart';
import 'package:hazari/pages/score_page.dart';

class PiontAddPage extends StatefulWidget {
  const PiontAddPage({super.key});

  @override
  State<PiontAddPage> createState() => _PiontAddPageState();
}

class _PiontAddPageState extends State<PiontAddPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hazari'),
        toolbarHeight: 200,

        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
//TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Pts"),),
      body: Container(
        // alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Text("Player1", style: TextStyle(color: Colors.blue),),
                      SizedBox(
                        width: 150,
                        child: TextField(

                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Text("Player1", style: TextStyle(color: Colors.blue),),
                      SizedBox(
                        width: 150,
                        child: TextField(

                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("Player1", style: TextStyle(color: Colors.blue),),
                    SizedBox(
                      width: 150,
                      child: TextField(

                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Player1", style: TextStyle(color: Colors.blue),),
                    SizedBox(
                      width: 150,
                      child: TextField(

                      ),
                    ),
                  ],
                ),


              ],
            ),

          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 64,
        width: 64,
        child: FloatingActionButton(
          elevation: 10,

          child: Text('Done'),
          backgroundColor: Colors.blue,
          onPressed: (){
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //       builder: (context) => ScorePage(
            //
            //       )
            //   ),
            // );
          },
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: Colors.white, strokeAlign: BorderSide.strokeAlignOutside),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: const CircularNotchedRectangle(),
      ),
    );
  }
}
