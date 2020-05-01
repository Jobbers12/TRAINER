import 'package:flutter/material.dart';
import 'package:trainer/Enums.dart';
import 'package:trainer/main.dart';
import 'package:trainer/models/AppStateModel.dart';
import 'package:trainer/models/GoalModel.dart';

class AppContainer extends StatefulWidget {
  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  AppStateModel appState;

  @override
  void initState() {
    appState = AppStateModel(
      userID: '123',
      userName: 'John',
      userAge: 24,
      userWeight: 73.0,
      userGender: Gender.male,
      goals: <GoalModel>[
        GoalModel(
          goalID: '123abc',
          goalName: '5K BBY!',
          goalType: GoalType.run,
          goalSubType: GoalSubType.five,
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
    );
  }
}
