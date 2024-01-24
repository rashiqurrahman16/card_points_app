import 'package:flutter/material.dart';

class PlayerNamePage extends StatefulWidget {
  const PlayerNamePage({super.key});

  @override
  State<PlayerNamePage> createState() => _PlayerNamePageState();
}

class _PlayerNamePageState extends State<PlayerNamePage> {
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


      body: SafeArea(

        child: Column(
          children: [
            Column(
              children: [
                Row(

                  children: [


                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      width: screenSize.width/4,
                      child: Text("ABCDEF", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      alignment: Alignment.center,

                      padding: EdgeInsets.all(5),
                      width: screenSize.width/4,
                      child: Text("ABCDEF", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      width: screenSize.width/4,
                      child: Text("ABCDEF", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      width: screenSize.width/4,
                      child: Text("ABCDEF", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                    ),


                  ],
                ),

              ],
            ),
            SizedBox(height: 10),



            Column(
              children: [
                Row(

                  children: [


                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      width: screenSize.width/4,
                      child: Text("150", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      alignment: Alignment.center,

                      padding: EdgeInsets.all(5),
                      width: screenSize.width/4,
                      child: Text("100", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      width: screenSize.width/4,
                      child: Text("50", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      width: screenSize.width/4,
                      child: Text("60", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
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
          elevation: 0,
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: (){},
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: Colors.white, strokeAlign: BorderSide.strokeAlignOutside),
            borderRadius: BorderRadius.circular(100),
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
              IconButton(
                color: Colors.white,
                iconSize: 30,
                padding: EdgeInsets.symmetric(horizontal: 40),
                icon: Icon(Icons.minimize_rounded),
                onPressed: (){},
              ),
              IconButton(
                color: Colors.white,
                iconSize: 30,
                padding: EdgeInsets.symmetric(horizontal: 40),
                icon: Icon(Icons.refresh),
                onPressed: (){},
              ),
            ],
          ),

        ),
      ),
    );
  }
}
