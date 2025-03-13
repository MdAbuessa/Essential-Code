import 'package:flutter/material.dart';

class Cardpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Card Example')),
      body: Center(
        child: Card(
          color: Colors.yellow,
          shadowColor: Colors.red,
          elevation: 4.0, // Adjust the shadow depth
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
              bottomRight: Radius.circular(60),
            ), // Rounded corners
          ),
          margin: EdgeInsets.all(16.0), // Space around the card
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Wrap content tightly
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.album),
                  title: Text('The Enchanted Nightingale'),
                  subtitle: Text(
                    'Music by Julie Gable. Lyrics by Sidney Stein.',
                  ),
                ),
                Divider(thickness: 1.5, color: Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () {
                        /* ... */
                      },
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('LISTEN'),
                      onPressed: () {
                        /* ... */
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
