import 'package:flutter/material.dart';
import 'package:trainer/Enums.dart';
import 'package:trainer/main.dart';
import 'package:trainer/models/ActivityModel.dart';
import 'package:trainer/models/AppStateModel.dart';
import 'package:trainer/models/GoalModel.dart';
import 'package:trainer/models/SessionModel.dart';

class AppContainer extends StatefulWidget {
  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  AppStateModel appState;
  ActivityModel activityModel;

  @override
  void initState() {
    appState = AppStateModel(
      userID: '',
      userFirstTimeUse: true,
      userName: 'Jake',
      userAge: 24,
      userWeight: 73.0,
      userGender: Gender.male,
      goals: <GoalModel>[
        GoalModel(
          goalID: 'a',
          goalName: '5K BBY!',
          goalType: GoalType.run,
          goalSubType: GoalSubType.five,
        ),
        GoalModel(
          goalID: 'b',
          goalName: '10K DOLL!',
          goalType: GoalType.run,
          goalSubType: GoalSubType.ten,
        ),
      ],
      sessions: <SessionModel>[
        SessionModel(
          sessionID: 'a',
          sessionGoalID: 'a',
          sessionDate: DateTime.utc(2021, 12, 01),
          sessionIsComplete: true,
          sessionIsRunning: false,
        ),
        SessionModel(
          sessionID: 'b',
          sessionGoalID: 'a',
          sessionDate: DateTime.utc(2021, 12, 02),
          sessionIsComplete: false,
          sessionIsRunning: false,
        ),
        SessionModel(
          sessionID: 'c',
          sessionGoalID: 'a',
          sessionDate: DateTime.utc(2021, 12, 03),
          sessionIsComplete: false,
          sessionIsRunning: false,
        ),
        SessionModel(
          sessionID: 'd',
          sessionGoalID: 'a',
          sessionDate: DateTime.utc(2021, 12, 01),
          sessionIsComplete: false,
          sessionIsRunning: false,
        ),
        SessionModel(
          sessionID: 'e',
          sessionGoalID: 'b',
          sessionDate: DateTime.utc(2020, 12, 01),
          sessionIsComplete: false,
          sessionIsRunning: false,
        ),
        SessionModel(
          sessionID: 'f',
          sessionGoalID: 'b',
          sessionDate: DateTime.utc(2020, 12, 02),
          sessionIsComplete: false,
          sessionIsRunning: false,
        ),
        SessionModel(
          sessionID: 'g',
          sessionGoalID: 'b',
          sessionDate: DateTime.utc(2020, 12, 03),
          sessionIsComplete: false,
          sessionIsRunning: false,
        ),
        SessionModel(
          sessionID: 'h',
          sessionGoalID: 'b',
          sessionDate: DateTime.utc(2020, 12, 01),
          sessionIsComplete: false,
          sessionIsRunning: false,
        ),
      ],
      activities: <ActivityModel>[
        ActivityModel(
          activityID: 'a',
          activitySessionID: 'a',
          activityType: ActivityType.warmup,
          activityTime: 5,
          activityActive: true,
        ),
        ActivityModel(
          activityID: 'b',
          activitySessionID: 'a',
          activityType: ActivityType.run,
          activityTime: 6,
          activityActive: false,
        ),
        ActivityModel(
          activityID: 'c',
          activitySessionID: 'a',
          activityType: ActivityType.walk,
          activityTime: 7,
          activityActive: false,
        ),
        ActivityModel(
          activityID: 'd',
          activitySessionID: 'a',
          activityType: ActivityType.run,
          activityTime: 8,
          activityActive: false,
        ),
        ActivityModel(
          activityID: 'e',
          activitySessionID: 'a',
          activityType: ActivityType.cooldown,
          activityTime: 9,
          activityActive: false,
        ),
      ],
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return App(
      userID: appState.userID,
      userName: appState.userName,
      goals: appState.goals,
      sessions: appState.sessions,
      activities: appState.activities,
      userFirstTimeUse: appState.userFirstTimeUse,
      onFirstTimeUse: () => _handleFirstTimeUse(),
    );
  }

  // Set State after user has loaded the app for the first time
  _handleFirstTimeUse() {
    setState(() {
      appState = appState.copyWith(
        userFirstTimeUse: false,
        userID: '1',
      );
    });
  }
}
