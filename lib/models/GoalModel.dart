import 'package:meta/meta.dart';

import 'package:trainer/Enums.dart';
import 'package:trainer/models/SessionModel.dart';

class GoalModel {
  final String goalID;
  final GoalType goalType;
  final GoalSubType goalSubType;
  final String goalName;
  final List<SessionModel> sessions;

  GoalModel({
    @required this.goalID,
    this.goalType,
    this.goalSubType,
    this.goalName,
    this.sessions,
  });
}
