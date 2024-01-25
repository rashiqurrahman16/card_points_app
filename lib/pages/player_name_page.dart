import 'package:flutter/material.dart';
import 'package:hazari/pages/score_page.dart';

class PlayerNamePage extends StatefulWidget {
  const PlayerNamePage({super.key});

  @override
  State<PlayerNamePage> createState() => _PlayerNamePageState();
}

class _PlayerNamePageState extends State<PlayerNamePage> {

  final TextEditingController _player1 = TextEditingController();
  final TextEditingController _player2 = TextEditingController();
  final TextEditingController _player3 = TextEditingController();
  final TextEditingController _player4 = TextEditingController();



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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: TextField(
                    controller: _player1,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Player 1"),
                  )
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: TextField(
                    controller: _player2,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Player 2"),
                  )
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: TextField(
                    controller: _player3,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Player 3"),
                  )
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: TextField(
                    controller: _player4,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Player 4"),
                  )
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
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => ScorePage(
                    player1: _player1.text,
                    player2: _player2.text,
                    player3: _player3.text,
                    player4: _player4.text,
                  )
              ),
            );
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
