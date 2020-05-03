import 'package:trainer/Enums.dart';

class ActivityModel {
  final String activityID;
  final ActivityType activityType; // Eg walk, run, warmup, etc
  final int activityTime; // Duration of an activity
  final bool activityActive;

  ActivityModel({
    this.activityID,
    this.activityType,
    this.activityTime,
    this.activityActive,
  });
}
