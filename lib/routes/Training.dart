import 'package:flutter/material.dart';
import 'package:trainer/routes/Session.dart';
import 'package:trainer/styles/Styles.dart';

class Training extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Styles.backgroundColor,
          child: Padding(
            padding: Styles.globalPagePadding, // Padding for the entire page
            child: Column(
              // Column for entire page
              children: [
                Row(
                  children: [
                    Padding(
                      padding: Styles.headingPadding,
                      child: Text('Training', style: Styles.headerLarge),
                    )
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(height: 30),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => Session()));
                      },
                      child: const Text('Start 5K',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
