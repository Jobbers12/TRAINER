import 'package:flutter/material.dart';
import 'package:trainer/AppContainer.dart';
import 'package:trainer/models/ActivityModel.dart';
import 'package:trainer/models/GoalModel.dart';
import 'package:trainer/models/SessionModel.dart';
import 'package:trainer/navigation/BottomNavigation.dart';
import 'package:trainer/routes/Onboarding.dart';

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
  final String userName;

  final List<GoalModel> goals;
  final List<SessionModel> sessions;
  final List<ActivityModel> activities;

  final bool userFirstTimeUse;
  final dynamic onFirstTimeUse;

  App({
    this.userID,
    this.userFirstTimeUse,
    this.userName,
    this.goals,
    this.sessions,
    this.activities,
    this.onFirstTimeUse,
  });

  @override
  Widget build(BuildContext context) {
    if (userFirstTimeUse == true && userID == '') {
      // NEW USER
      return Onboarding(onFirstTimeUse: onFirstTimeUse);
    }

    if (userID == '') {
      // USER NOT LOGGED IN
      return Text('User not logged in');
    }

    return Container(
      // EXISTING USER
      child: BottomNavigation(
        userName: userName,
        goals: goals,
        sessions: sessions,
        activities: activities,
      ),
    );
  }
}
