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

  ActivityModel copyWith({
    String activityID,
    ActivityType activityType,
    int activityTime,
    bool activityActive,
  }) {
    return ActivityModel(
      activityID: activityID ?? this.activityID,
      activityType: activityType ?? this.activityType,
      activityTime: activityTime ?? this.activityTime,
      activityActive: activityActive ?? this.activityActive,
    );
  }
}
