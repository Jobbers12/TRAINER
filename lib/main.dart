import 'package:flutter/material.dart';
import 'package:trainer/AppContainer.dart';
import 'package:trainer/navigation/BottomNavigation.dart';

void main() {
  runApp(TopApp());
}

class TopApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRAINER',
      home: SafeArea(child: AppContainer()),
    );
  }
}

class App extends StatelessWidget {
  final String userID;
  final String userName;

  App({
    this.userID,
    this.userName,
  });

  @override
  Widget build(BuildContext context) {
    if (userID == '') {
      // NEW USER
      return Text('NEW USER');
    } else {
      return Container(
        // EXISTING USER
        child: BottomNavigation(userName: userName),
      );
    }
  }
}
