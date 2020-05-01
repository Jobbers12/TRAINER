import 'package:flutter/material.dart';
import 'package:trainer/AppContainer.dart';
import 'package:trainer/models/GoalModel.dart';
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
      home: SafeArea(
        bottom: false, 
        child: AppContainer()),
    );
  }
}

class App extends StatelessWidget {
  final String userID;
  final String userName;

  final List<GoalModel> goals;

  App({
    this.userID,
    this.userName,
    this.goals,
  });

  @override
  Widget build(BuildContext context) {
    if (userID == '') {
      // NEW USER
      return Text('NEW USER');
    } else {
      return Container(
        // EXISTING USER
        child: BottomNavigation(userName: userName, goals: goals),
      );
    }
  }
}
