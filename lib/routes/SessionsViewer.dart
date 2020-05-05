import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trainer/models/ActivityModel.dart';
import 'package:trainer/models/SessionModel.dart';
import 'package:trainer/routes/Session.dart';
import 'package:trainer/styles/Styles.dart';

class SessionsViewer extends StatelessWidget {
  final String goalName;
  final List<SessionModel> sessions;

  SessionsViewer({
    this.goalName,
    this.sessions,
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
          sessions.firstWhere((s) => s.sessionComplete == false);

      return Expanded(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: sessions
              .map(
                (item) => SessionCard(
                  sessionID: item.sessionID,
                  sessionDate: item.sessionDate,
                  goalName: goalName,
                  activities: item.activities,
                  activeSession: activeSessionModel,
                  sessionComplete: item.sessionComplete,
                ),
              )
              .toList(),
        ),
      );
    }
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

  SessionCard({
    this.activities,
    this.sessionDate,
    this.goalName,
    this.activeSession,
    this.sessionID,
    this.sessionComplete,
  });

  @override
  Widget build(BuildContext context) {
    String _formattedDate = DateFormat('dd/MM/yyyy').format(sessionDate);

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Session(
                goalName: goalName,
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
                            _getSubText(),
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

  // TODO: Determines the time & distance estimate on session cards
  String _getSubText() {
    return '34 mins | 1.7km';
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
