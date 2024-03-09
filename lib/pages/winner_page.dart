import 'package:flutter/material.dart';


class WinningPage extends StatelessWidget {
  const WinningPage({

    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orange.shade400,
      alignment: Alignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min, // Ensure content fits within screen
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Text(
                  'Winner',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      winner,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      points.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: (){},
                    child: Text('Exit', style: TextStyle(color: Colors.white),)),
              ],
            ),
          ),
        ],
      ),
    );




  }
}

