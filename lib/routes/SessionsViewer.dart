import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trainer/SessionContainer.dart';
import 'package:trainer/models/ActivityModel.dart';
import 'package:trainer/models/SessionModel.dart';
import 'package:trainer/styles/Styles.dart';

class SessionsViewer extends StatelessWidget {
  final String goalName;

  final List<SessionModel> sessions;
  final List<ActivityModel> activities;

  SessionsViewer({
    this.goalName,
    this.sessions,
    this.activities,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Styles.backgroundColor,
        padding: Styles.globalPagePadding,
        child: Column(
          children: [
            Padding(
              padding: Styles.headingPadding,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Sessions', style: Styles.headerLarge),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        goalName,
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _getSessionsCardList(sessions, goalName),
            Row(
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('BACK'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Generates a list of session cards for the selected goal. Ensures that the goal actually has sessions generated.
  _getSessionsCardList(List<SessionModel> sessions, String goalName) {
    if (sessions == null) {
      return NoSessionsAvaliable();
    } else {
      SessionModel activeSessionModel =
          sessions.firstWhere((s) => s.sessionIsComplete == false);

      return Expanded(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: sessions
              .map(
                (e) => SessionCard(
                    goalName: goalName,
                    sessionID: e.sessionID,
                    sessionDate: e.sessionDate,
                    activities: _getActivitiesList(e.sessionID),
                    activeSession: activeSessionModel,
                    sessionComplete: e.sessionIsComplete,
                    sessionRunning: e.sessionIsRunning),
              )
              .toList(),
        ),
      );
    }
  }

  //Return list of activities that are apart of the session
  List<ActivityModel> _getActivitiesList(String sessionID) {
    List<ActivityModel> newList = activities
        .where((element) => element.activitySessionID == sessionID)
        .toList();

    if (newList.length == 0) {
      return <ActivityModel>[];
    }
    return newList;
  }
}

// SessionCard Widget. Creates a card for each session within a users goal
class SessionCard extends StatelessWidget {
  final List<ActivityModel> activities;

  final DateTime sessionDate;
  final String goalName;
  final SessionModel activeSession;
  final String sessionID;
  final bool sessionComplete;
  final bool sessionRunning;

  SessionCard({
    this.activities,
    this.sessionDate,
    this.goalName,
    this.activeSession,
    this.sessionID,
    this.sessionComplete,
    this.sessionRunning,
  });

  @override
  Widget build(BuildContext context) {
    String _formattedDate = DateFormat('dd/MM/yyyy').format(sessionDate);

    if (activities.length == 0) {
      return NoActivitiesAvaliable(formattedDate: _formattedDate);
    }

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SessionContainer(
                goalName: goalName,
                sessionRunning: sessionRunning,
                activities: activities,
              ),
            ),
          );
        },
        child: Container(
          color: _getCardColor(sessionID, activeSession),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    _getSessionIcon(sessionComplete),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            _formattedDate.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _getSubText(activities),
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[600],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Returns subText based on time & distance estimate
  String _getSubText(List<ActivityModel> activities) {
    if (activities.length == 0) {
      return 'This session has no activities.';
    }
    List<int> activityTimes = activities.map((e) => e.activityTime).toList();

    int seconds = activityTimes.reduce((value, element) => value + element);
    int mins = (seconds / 60).round();

    double distance = (mins / 6);

    return mins.toString() + ' mins | ' + distance.toStringAsFixed(2) + 'km';
  }

  // Returns the correct bg color for cards based on current session
  Color _getCardColor(String sessionID, SessionModel activeSession) {
    if (sessionID == activeSession.sessionID) {
      return Styles.activeColor;
    }
    return Styles.inActiveColor;
  }

  // Returns the correc icon based on compelted sesions
  Icon _getSessionIcon(bool sessionComplete) {
    if (sessionComplete == true) {
      return Icon(Icons.check_circle, size: 40);
    }
    return Icon(Icons.indeterminate_check_box, size: 40);
  }
}

// Used if there is no sessions within the selected goal
class NoSessionsAvaliable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              children: [
                Icon(Icons.error, size: 40),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'There are no sessions within this goal',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Used if there is no activities within a session
class NoActivitiesAvaliable extends StatelessWidget {
  final String formattedDate;

  NoActivitiesAvaliable({
    this.formattedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.red[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  Icon(Icons.error, size: 40),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          formattedDate.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                        children: [
                          Text(
                            'There are not activities within this session.',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[600],
                            ),
                          )
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
