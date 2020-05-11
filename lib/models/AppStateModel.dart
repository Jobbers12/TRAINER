import 'package:meta/meta.dart';

import 'package:trainer/Enums.dart';
import 'package:trainer/models/ActivityModel.dart';
import 'package:trainer/models/GoalModel.dart';
import 'package:trainer/models/SessionModel.dart';

class AppStateModel {
  final String userID;
  final bool userFirstTimeUse;
  final String userName;
  final int userAge;
  final double userWeight;
  final Gender userGender;

  final List<GoalModel> goals;
  final List<SessionModel> sessions;
  final List<ActivityModel> activities;

  AppStateModel({
    @required this.userID,
    this.userFirstTimeUse,
    this.userName,
    this.userAge,
    this.userWeight,
    this.userGender,
    this.goals,
    this.sessions,
    this.activities,
  });

  AppStateModel copyWith({
    String userID,
    bool userFirstTimeUse,
    String userName,
    int userAge,
    double userWeight,
    Gender userGender,
    List<GoalModel> goals,
    List<SessionModel> sessions,
    List<ActivityModel> activities,
  }) {
    return AppStateModel(
      userID: userID ?? this.userID,
      userFirstTimeUse: userFirstTimeUse ?? this.userFirstTimeUse,
      userName: userName ?? this.userName,
      userAge: userAge ?? this.userAge,
      userWeight: userWeight ?? this.userWeight,
      userGender: userGender ?? this.userGender,
      goals: goals ?? this.goals,
      sessions: sessions ?? this.sessions,
      activities: activities ?? this.activities,
    );
  }
}
