class SessionModel {
  final String sessionID;
  final String sessionGoalID; // Foreign Key of the related goal
  final DateTime sessionDate; // The date a session should be completed
  final bool sessionIsRunning;
  final bool sessionIsComplete; // Has the session been competed?

  SessionModel({
    this.sessionID,
    this.sessionGoalID,
    this.sessionDate,
    this.sessionIsRunning,
    this.sessionIsComplete,
  });
}