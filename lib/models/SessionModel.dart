import 'package:trainer/models/ActivityModel.dart';

class SessionModel {
  final List<ActivityModel> activities; // List of activities to make up the session
  final DateTime date; // The date a session should be completed

  SessionModel({
    this.activities,
    this.date,
  });
}