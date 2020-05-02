import 'package:flutter/material.dart';
import 'package:trainer/Enums.dart';
import 'package:trainer/styles/Styles.dart';

import 'package:intl/intl.dart';

class Session extends StatelessWidget {
  final String goalName;

  Session({
    this.goalName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Styles.backgroundColor,
        child: Padding(
            padding: Styles.globalPagePadding, // Padding for the entire page
            child: Column(
              children: [
                Padding(
                  padding: Styles.headingPadding,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(_getSessionName(), style: Styles.headerLarge),
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
                _timerCard(),
                Expanded(
                  child: ListView(
                    children: [
                      _activityCard(true, 90, ActivityType.run),
                      _activityCard(false, 60, ActivityType.walk),
                      _activityCard(false, 30, ActivityType.run),
                      _activityCard(false, 300, ActivityType.walk),
                      _activityCard(false, 300, ActivityType.walk),
                      _activityCard(false, 30, ActivityType.run),
                      _activityCard(false, 300, ActivityType.walk),
                      _activityCard(false, 300, ActivityType.walk),
                      _activityCard(false, 30, ActivityType.run),
                      _activityCard(false, 300, ActivityType.walk),
                      _activityCard(false, 300, ActivityType.walk),
                      _activityCard(false, 30, ActivityType.run),
                      _activityCard(false, 300, ActivityType.walk),
                      _activityCard(false, 300, ActivityType.walk),
                    ],
                  ),
                ),
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
            )),
      ),
    );
  }

  // Returns the timer card above all activity cards
  Widget _timerCard() {
    return Container(
      child: Card(
        color: Colors.blue[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  // ICON ****
                  Icon(Icons.timer, size: 40),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "00:00:00",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Returns an activity card with given values
  Widget _activityCard(bool active, int time, ActivityType type) {
    return Container(
      child: Card(
        color: _getActivityColor(active),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  _getActivityIcon(type),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          _getActivityType(type),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          _getSubtext(time, type),
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
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

  // Returns background color of the activity
  Color _getActivityColor(bool active) {
    if (active == true) {
      return Styles.activeColor;
    } else {
      return Colors.grey[350];
    }
  }

  // Returns icon for the activity
  _getActivityIcon(ActivityType type) {
    switch (type) {
      case ActivityType.warmup:
        {
          return Icon(Icons.directions_walk, size: 40);
        }
        break;
      case ActivityType.cooldown:
        {
          return Icon(Icons.directions_walk, size: 40);
        }
        break;
      case ActivityType.walk:
        {
          return Icon(Icons.directions_walk, size: 40);
        }
        break;
      case ActivityType.jog:
        {
          return Icon(Icons.directions_run, size: 40);
        }
        break;
      case ActivityType.run:
        {
          return Icon(Icons.directions_run, size: 40);
        }
        break;
      case ActivityType.sprint:
        {
          return Icon(Icons.directions_run, size: 40);
        }
        break;
    }
  }

  // Returns string of the activity type name
  _getActivityType(ActivityType type) {
    switch (type) {
      case ActivityType.warmup:
        {
          return 'WARMUP';
        }
        break;
      case ActivityType.cooldown:
        {
          return 'COOLDOWN';
        }
        break;
      case ActivityType.walk:
        {
          return 'WALK';
        }
        break;
      case ActivityType.jog:
        {
          return 'JOG';
        }
        break;
      case ActivityType.run:
        {
          return 'RUN';
        }
        break;
      case ActivityType.sprint:
        {
          return 'SPRINT';
        }
        break;
    }
  }

  // Returns the subtext
  _getSubtext(int time, ActivityType type) {
    String activityType;

    switch (type) {
      case ActivityType.warmup:
        {
          activityType = 'warmup';
        }
        break;
      case ActivityType.cooldown:
        {
          activityType = 'cooldown';
        }
        break;
      case ActivityType.walk:
        {
          activityType = 'walking';
        }
        break;
      case ActivityType.jog:
        {
          activityType = 'jogging';
        }
        break;
      case ActivityType.run:
        {
          activityType = 'running';
        }
        break;
      case ActivityType.sprint:
        {
          activityType = 'sprinting';
        }
        break;
    }

    if (time < 60) {
      return time.toString() + ' seconds' + ' ' + activityType;
    }

    if (time == 60) {
      return '1 min' + ' ' + activityType;
    }

    if (time == 90) {
      return '90 seconds' + ' ' + activityType;
    }

    if (time > 60) {
      double timeMins = time / 60;

      return timeMins.toStringAsFixed(
              timeMins.truncateToDouble() == timeMins ? 0 : 1) +
          ' mins' +
          ' ' +
          activityType;
    }
  }

  // Returns the name of the session using the day
  String _getSessionName() {
    var day = DateTime.now();

    String dayName = DateFormat('EEEE').format(day);

    return dayName + ' Session';
  }
}
