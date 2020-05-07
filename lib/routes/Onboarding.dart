import 'package:flutter/material.dart';
import 'package:trainer/styles/Styles.dart';

class Onboarding extends StatelessWidget {
final dynamic onFirstTimeUse;

Onboarding({
  this.onFirstTimeUse,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Styles.globalPagePadding,
        child: Row(children: [
          Text('FIRST TIME USER'),
          FlatButton(
            onPressed: () => _handleFirstTimeUser(),
            child: Text('Done...'),
            color: Colors.green,
          )
        ],),
      ),
    );
  }

  // Set State after user has completed the onboarding & authentication process
  void _handleFirstTimeUser() {
    onFirstTimeUse();
  }
}