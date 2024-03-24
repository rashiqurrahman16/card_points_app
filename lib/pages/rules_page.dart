

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Hazari/widgets/exit_confirmation_page.dart';
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

        body: SafeArea(
            child: Center(
              child: SizedBox(
                width: screenSize.width*.90,
                child: ListView(
                  children: [
                    SizedBox(height: 40,),
                    Text("Goal:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("Be the player with the most points when someone reaches 1000 points.", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),

                    SizedBox(height: 10,),
                    Text("Cards:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("Standard deck (52 cards)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),

                    SizedBox(height: 10,),
                    Text("Setup:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("1. At the beginning of the game, player 1 is chosen as the Dealer. The dealing responsibility then passes clockwise after each round.).", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("2. Dealer shuffles and deals all cards (13 per player).", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("3. Players sort cards into 4 combinations (3 cards each for the first 3, 4 cards for the last). The last combination must be the weakest.", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("4. Players call 'up' when finished sorting.", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),

                    SizedBox(height: 10,),
                    Text("Card Ranking:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("1. Ace(high),King,Queen,Jack,10,9,8,7,6,5,4,3,2 (low)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("2. All cards except Ace-10 are worth 5 points each.", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("3. Total points per round: 360", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),

                    SizedBox(height: 10,),
                    Text("Combinations (Highest to Lowest):", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("1. Troy: 3 cards of the same rank (e.g., 3 Kings)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("2. Color Run: 3 consecutive cards of the same suit (e.g., A-K-Q of Spades)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("3. Run: 3 consecutive cards of any suit (e.g., 10-J-Q)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("4. Color: 3 cards of the same suit, not consecutive (ranked by highest card)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("5. Pair: 2 cards of the same rank + 1 different card (ranked by pair value)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("6. Indi: 3 unmatched cards (ranked by highest card)", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),

                    SizedBox(height: 10,),
                    Text("Gameplay:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("1. Player to the right of the dealer starts.", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("2. All players play their highest-ranked combination for the current round.", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("3. Highest combination wins all played cards and leads the next round.", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("4. Ties are broken by who played last.", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("5. This is repeated for all 4 combinations.", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("6. This is repeated for all 4 combinations.", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),

                    SizedBox(height: 10,),
                    Text("Scoring: ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("1. After all combinations are played, players score their won cards (points).", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("2. Scores are cumulative across rounds.", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),
                    Text("3. Game ends when a player reaches 1000 points (or more) at the end of a round.", style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,),

                    SizedBox(height: 10,),
                    Text("Winner:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,),
                    Text("The player with the highest score at the end of the game wins!", style: TextStyle(fontSize: 14),
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
                    onPressed: () async {
                      await ExitConfirmationPage().showExitConfirmationDialog(context);
                    }, child: Text("Exit Game",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )),
              ],
            ),

          ),
        )

    );
  }

}
