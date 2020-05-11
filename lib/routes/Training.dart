import 'package:flutter/material.dart';
import 'package:trainer/Enums.dart';
import 'package:trainer/models/ActivityModel.dart';
import 'package:trainer/models/GoalModel.dart';
import 'package:trainer/models/SessionModel.dart';
import 'package:trainer/routes/SessionsViewer.dart';
import 'package:trainer/styles/Styles.dart';

class Training extends StatelessWidget {
  final List<GoalModel> goals;
  final List<SessionModel> sessions;
  final List<ActivityModel> activities;

  Training({
    this.goals,
    this.sessions,
    this.activities,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: Styles.globalPagePadding,
        color: Styles.backgroundColor,
        child: Column(
          // Column for entire page
          children: [
            Row(
              children: [
                Padding(
                  padding: Styles.headingPadding,
                  child: Text('Current Goals', style: Styles.headerLarge),
                )
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(0.0),
                children: goals
                    .map(
                      (item) => GoalCard(
                        goalName: item.goalName,
                        goalType: item.goalType,
                        goalSubType: item.goalSubType,
                        sessions: _getSessionsList(item.goalID),
                        activities: activities,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Return list of sessions that are apart of the goal
  List<SessionModel> _getSessionsList(String goalID) {
    return sessions.where((e) => e.sessionGoalID == goalID).toList();
  }
}

// GoalCard Widget. Creates a card for each goal based on GoalModel
class GoalCard extends StatelessWidget {
  final String sessionID;
  final String goalName;
  final GoalType goalType;
  final GoalSubType goalSubType;

  final List<SessionModel> sessions;
  final List<ActivityModel> activities;

  GoalCard({
    this.sessionID,
    this.goalName,
    this.goalType,
    this.goalSubType,
    this.sessions,
    this.activities,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SessionsViewer(
                goalName: goalName,
                sessions: sessions,
                activities: activities,
              ),
            ),
          );
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    _getGoalIcon(goalType),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            goalName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _getSubText(goalSubType),
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

// Returns icon for the goal
_getGoalIcon(GoalType type) {
  switch (type) {
    case GoalType.run:
      return Icon(Icons.directions_run, size: 40);
      break;
    default:
  }
}

// Returns Sub Text for a goal
_getSubText(GoalSubType subtype) {
  String prefix = 'Goal to achieve a ';
  String suffix = '!';

  switch (subtype) {
    case GoalSubType.five:
      return prefix + '5k' + suffix;
      break;
    case GoalSubType.ten:
      return prefix + '10k' + suffix;
      break;
    case GoalSubType.maraHalf:
      return prefix + 'half marathon' + suffix;
      break;
    case GoalSubType.maraFull:
      return prefix + 'full marathon' + suffix;
      break;
    case GoalSubType.ultra:
      return 'Lets run an ultra marathon' + suffix;
      break;
    case GoalSubType.trail:
      return 'Lets become a trail runner' + suffix;
      break;
    default:
  }
}
