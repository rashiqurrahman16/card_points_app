import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitConfirmationPage{
  Future<void> showExitConfirmationDialog(BuildContext context) async {
    // _willExitApp = true; // Set flag to prevent immediate exit
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
                width: 90,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
                    onPressed: () {
                      Navigator.pop(context); // Cancel exit
                      // _willExitApp = false; // Reset flag
                    },
                    child: Text('No', style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              SizedBox(
                height: 50,
                width: 90,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
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