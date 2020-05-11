import 'package:flutter/material.dart';
import 'package:trainer/Enums.dart';
import 'package:trainer/audio/Audio.dart';
import 'package:trainer/models/ActivityModel.dart';
import 'package:trainer/styles/Styles.dart';

class Session extends StatelessWidget {
  final String goalName;

  final bool sessionRunning;
  final List<ActivityModel> activities;

  final AnimationController controller;
  final String timerString;

  final String sessionName;

  final dynamic onBackPressed;
  final dynamic onStartPressed;
  final dynamic onPausePressed;

  Session({
    this.goalName,
    this.sessionRunning,
    this.activities,
    this.controller,
    this.timerString,
    this.sessionName,
    this.onBackPressed,
    this.onStartPressed,
    this.onPausePressed,
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
                        Text(sessionName, style: Styles.headerLarge),
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
              TimerCard(
                controller: controller,
                timerString: timerString,
              ),
              _getActivityCardList(activities),
              ButtonBar(
                children: [
                  FlatButton(
                    child: Text('Back'),
                    color: Colors.green,
                    onPressed: () {
                      //_stopTimer();
                      _handleBackPressed();
                    },
                  ),
                  FlatButton(
                    child: Text('Pause'),
                    color: Colors.green,
                    onPressed: () {
                      _handlePausePressed();
                    },
                  ),
                  FlatButton(
                    child: Text('Start'),
                    color: Colors.green,
                    onPressed: () {
                      _handleStartPressed();
                    },
                  ),
                  Audio(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleBackPressed() {
    onBackPressed();
  }

  // Handles the start of the timer
  void _handleStartPressed() {
    onStartPressed();
  }

  // Handles the pause of the timer
  void _handlePausePressed() {
    onPausePressed();
  }

  // Generates a list of activity cards for the selected session. Ensures that there are activities within the session
  _getActivityCardList(List<ActivityModel> activities) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: activities
            .map(
              (activity) => ActivityCard(
                activityActive: activity.activityActive,
                activityTime: activity.activityTime,
                activityType: activity.activityType,
              ),
            )
            .toList(),
      ),
    );
  }
}

// Returns an activity card with given values
class ActivityCard extends StatelessWidget {
  final bool activityActive;
  final int activityTime;
  final ActivityType activityType;

  ActivityCard({
    this.activityActive,
    this.activityTime,
    this.activityType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: _getActivityColor(activityActive),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
                  _getActivityIcon(activityType),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          _getActivityType(activityType),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          _getSubtext(activityTime, activityType),
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
  Color _getActivityColor(bool activityActive) {
    if (activityActive == true) {
      return Styles.activeColor;
    } else {
      return Styles.inActiveColor;
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
}

class TimerCard extends StatelessWidget {
  final AnimationController controller;
  final String timerString;

  TimerCard({
    this.controller,
    this.timerString,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.blue[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                children: [
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
                            AnimatedBuilder(
                              animation: controller,
                              builder: (BuildContext context, Widget child) {
                                return Text(
                                  timerString,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                  ),
                                );
                              },
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
}

// Used if there is no activies within the selected session
class NoActivitiesAvaliable extends StatelessWidget {
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
                        'There are no activities within this session',
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
