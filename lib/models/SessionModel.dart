import 'package:trainer/models/ActivityModel.dart';

class SessionModel {
  final String sessionID;
  final DateTime sessionDate; // The date a session should be completed
  final bool sessionRunning;
  final bool sessionComplete; // Has the session been competed?
  final List<ActivityModel> activities; // List of activities to make up the session

  SessionModel({
    this.sessionID,
    this.sessionDate,
    this.sessionRunning,
    this.sessionComplete,
    this.activities,
  });
}