import 'package:flutter/material.dart';
import 'package:trainer/Enums.dart';
import 'package:trainer/models/GoalModel.dart';
import 'package:trainer/routes/Session.dart';
import 'package:trainer/styles/Styles.dart';

class Training extends StatelessWidget {
  final List<GoalModel> goals;

  Training({
    this.goals,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Styles.backgroundColor,
        child: Padding(
          padding: Styles.globalPagePadding, // Padding for the entire page
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
                  children: goals
                      .map((item) => GoalCard(
                            goalID: item.goalID,
                            goalName: item.goalName,
                            goalType: item.goalType,
                            goalSubType: item.goalSubType,
                          ))
                      .toList(),

                  //_goalCard(context, 'abc123', 'ANOTHER RUN', GoalType.run, GoalSubType.five)
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add goal button
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
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

// GoalCard Widget. Creates a card for each goal based on GoalModel
class GoalCard extends StatelessWidget {
  final String goalID;
  final String goalName;
  final GoalType goalType;
  final GoalSubType goalSubType;

  GoalCard({
    this.goalID,
    this.goalName,
    this.goalType,
    this.goalSubType,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
              // TODO: Open correct session based on goalID. Need to work out how sessions are generated first.
              context,
              MaterialPageRoute(builder: (context) => Session()));
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [_getGoalIcon(goalType)],
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
