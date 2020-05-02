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
      debugShowCheckedModeBanner: false,
      home: AppContainer(),
    );
  }
}

class App extends StatelessWidget {
  final String userID;
  final bool userFirstTimeUse;
  final String userName;

  final List<GoalModel> goals;

  App({
    this.userID,
    this.userFirstTimeUse,
    this.userName,
    this.goals,
  });

  @override
  Widget build(BuildContext context) {
    if (userID == '') {
      if (userFirstTimeUse == true) {
        // NEW USER
        // TODO: SET STATE FOR userFirstTimeUse
        return Text('New user');
      } else {
        // USER NOT LOGGED IN
        return Text('User not logged in');
      }
      
    } else {
      return Container(
        // EXISTING USER
        child: BottomNavigation(userName: userName, goals: goals),
      );
    }
  }
}