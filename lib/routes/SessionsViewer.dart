import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
}

// Generates a list of session cards for the selected goal. Ensures that the goal actually has sessions generated.
_getSessionsCardList(List<SessionModel> sessions, String goalName) {
  if (sessions == null) {
    return NoSessionsAvaliable();
  } else {
    return Expanded(
      child: ListView(
        children: sessions
            .map((item) => SessionCard(
                  sessionDate: item.sessionDate,
                  goalName: goalName,
                ))
            .toList(),
      ),
    );
  }
}

// SessionCard Widget. Creates a card for each session within a users goal
class SessionCard extends StatelessWidget {
  final DateTime sessionDate;
  final String goalName;

  SessionCard({
    this.sessionDate,
    this.goalName,
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
                builder: (context) => Session(goalName: goalName)),
          );
        },
        child: Container(
          color: Styles.activeColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.directions_run, size: 40),
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
                      // TODO: Automate time & distance estimate on session cards
                      Row(
                        children: [
                          Text(
                            '34 mins | 2.7km ',
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