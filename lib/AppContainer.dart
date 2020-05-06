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

  @override
  void initState() {
    appState = AppStateModel(
      userID: '123',
      userFirstTimeUse: false,
      userName: 'Jake',
      userAge: 24,
      userWeight: 73.0,
      userGender: Gender.male,
      goals: <GoalModel>[
        GoalModel(
          goalID: '123abc',
          goalName: '5K BBY!',
          goalType: GoalType.run,
          goalSubType: GoalSubType.five,
          sessions: <SessionModel>[
            SessionModel(
              sessionID: 'a',
              sessionDate: DateTime.utc(2020, 12, 01),
              sessionComplete: true,
              activities: <ActivityModel>[
                ActivityModel(
                  activityID: 'a',
                  activityType: ActivityType.warmup,
                  activityTime: 10,
                  activityActive: true,
                ),
                ActivityModel(
                  activityID: 'b',
                  activityType: ActivityType.run,
                  activityTime: 90,
                  activityActive: false,
                ),
                ActivityModel(
                  activityID: 'c',
                  activityType: ActivityType.walk,
                  activityTime: 120,
                  activityActive: false,
                ),
                ActivityModel(
                  activityID: 'd',
                  activityType: ActivityType.run,
                  activityTime: 120,
                  activityActive: false,
                ),
                ActivityModel(
                  activityID: 'e',
                  activityType: ActivityType.cooldown,
                  activityTime: 300,
                  activityActive: false,
                ),
              ],
            ),
            SessionModel(
              sessionID: 'b',
              sessionDate: DateTime.utc(2020, 12, 02),
              sessionComplete: false,
              activities: <ActivityModel>[
                ActivityModel(
                  activityID: 'a',
                  activityType: ActivityType.jog,
                  activityTime: 300,
                  activityActive: false,
                ),
                ActivityModel(
                  activityID: 'b',
                  activityType: ActivityType.run,
                  activityTime: 90,
                  activityActive: true,
                ),
                ActivityModel(
                  activityID: 'c',
                  activityType: ActivityType.walk,
                  activityTime: 120,
                  activityActive: false,
                ),
                ActivityModel(
                  activityID: 'd',
                  activityType: ActivityType.run,
                  activityTime: 120,
                  activityActive: false,
                ),
                ActivityModel(
                  activityID: 'e',
                  activityType: ActivityType.cooldown,
                  activityTime: 300,
                  activityActive: false,
                ),
              ],
            ),
            SessionModel(
              sessionID: 'c',
              sessionDate: DateTime.utc(2020, 12, 03),
              sessionComplete: false,
              activities: <ActivityModel>[
                ActivityModel(
                  activityID: 'a',
                  activityType: ActivityType.sprint,
                  activityTime: 300,
                  activityActive: false,
                ),
                ActivityModel(
                  activityID: 'b',
                  activityType: ActivityType.run,
                  activityTime: 90,
                  activityActive: false,
                ),
                ActivityModel(
                  activityID: 'c',
                  activityType: ActivityType.walk,
                  activityTime: 120,
                  activityActive: true,
                ),
                ActivityModel(
                  activityID: 'd',
                  activityType: ActivityType.run,
                  activityTime: 120,
                  activityActive: false,
                ),
                ActivityModel(
                  activityID: 'e',
                  activityType: ActivityType.cooldown,
                  activityTime: 300,
                  activityActive: false,
                ),
              ],
            ),
          ],
        ),
        GoalModel(
          goalID: '456abc',
          goalName: '10K DOLL!',
          goalType: GoalType.run,
          goalSubType: GoalSubType.ten,
        ),
      ],
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return App(
      userID: appState.userID,
      userFirstTimeUse: appState.userFirstTimeUse,
      userName: appState.userName,
      goals: appState.goals,
    );
  }
}
