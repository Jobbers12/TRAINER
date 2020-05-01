import 'package:trainer/Enums.dart';

class ActivityModel {
  final ActivityType activityType; // Eg walk, run, warmup, etc
  final int time; // Duration of an activity

  ActivityModel({
    this.activityType,
    this.time,
  });
}
