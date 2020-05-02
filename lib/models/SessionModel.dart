import 'package:trainer/models/ActivityModel.dart';

class SessionModel {
  final String sessionID;
  final DateTime sessionDate; // The date a session should be completed
  final bool sessionComplete;
  final List<ActivityModel> activities; // List of activities to make up the session

  SessionModel({
    this.sessionID,
    this.sessionDate,
    this.sessionComplete,
    this.activities,
  });
}