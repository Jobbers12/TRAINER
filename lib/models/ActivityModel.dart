import 'package:trainer/Enums.dart';

class ActivityModel {
  final String activityID;
  final String activityGoalID; // Foreign key of the related goal
  final String activitySessionID; // Foreign key of the related session
  final ActivityType activityType; // Eg walk, run, warmup, etc
  final int activityTime; // Duration of an activity
  final bool activityActive;

  ActivityModel({
    this.activityID,
    this.activityGoalID,
    this.activitySessionID,
    this.activityType,
    this.activityTime,
    this.activityActive,
  });
}