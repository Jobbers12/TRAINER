import 'package:trainer/Enums.dart';

class GoalModel {
  final String goalID;
  final GoalType goalType;
  final GoalSubType goalSubType;
  final String goalName;

  GoalModel({
    this.goalID,
    this.goalType,
    this.goalSubType,
    this.goalName,
  });
}
