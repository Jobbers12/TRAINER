import 'package:flutter/material.dart';
import 'package:trainer/Enums.dart';
import 'package:trainer/models/ActivityModel.dart';
import 'package:trainer/styles/Styles.dart';

import 'package:intl/intl.dart';

_TimerCardState _state;

class Session extends StatelessWidget {
  final String goalName;

  final bool sessionRunning;
  final List<ActivityModel> activities;

  Session({
    this.goalName,
    this.sessionRunning,
    this.activities,
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
              TimerCard(
                activities: activities,
              ),
              _getActivityCardList(activities),
              ButtonBar(
                children: [
                  FlatButton(
                    child: Text('Back'),
                    color: Colors.green,
                    onPressed: () {
                      _stopTimer();
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text('Pause'),
                    color: Colors.green,
                    onPressed: () {
                      _pauseTimer();
                    },
                  ),
                  FlatButton(
                      child: Text('Start'),
                      color: Colors.green,
                      onPressed: () {
                        _startTimer();
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Handles the start of the timer
  _startTimer() {
    _state.startTimer();
  }

  // Handles the pause of the timer
  _pauseTimer() {
    _state.pauseTimer();
  }

  // Handles the stop of the timer
  _stopTimer() {}

  // Generates a list of activity cards for the selected session. Ensures that there are activities within the session
  _getActivityCardList(List<ActivityModel> activities) {
    if (activities == null) {
      return NoActivitiesAvaliable();
    } else {
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

  // Returns the name of the session using the day
  String _getSessionName() {
    var day = DateTime.now();

    String dayName = DateFormat('EEEE').format(day);

    return dayName + ' Session';
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

// Returns Timer Widget
class TimerCard extends StatefulWidget {
  final List<ActivityModel> activities;

  TimerCard({
    this.activities,
  });

  @override
  _TimerCardState createState() {
    _state = _TimerCardState();
    return _state;
  }
}

class _TimerCardState extends State<TimerCard> with TickerProviderStateMixin {
  AnimationController controller;
  bool isRunning = false;

  List<int> activityTimes;
  int activitiesRun;
  int activitiesTotal;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    if (isRunning == true) {
      return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    }
    return '...';
  }

  @override
  void initState() {
    super.initState();

    // Create list of activity times
    activityTimes = widget.activities.map((e) => e.activityTime).toList();
    activitiesTotal = activityTimes.length;

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: activityTimes[0] + 1),
    );

    controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.dismissed) {
        if (activitiesRun < activitiesTotal) {
          controller.duration =
              Duration(seconds: activityTimes[activitiesRun] + 1);
          controller.reverse(
              from: controller.value == 0.0 ? 1.0 : controller.value);
          activitiesRun++;
        } else {
          // SESSION COMPLETE
            isRunning = false;
          return;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    isRunning = false;
    super.dispose();
  }

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
                                return Text(timerString,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32,
                                    ));
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

  // Start the timer animation
  startTimer() {
    activitiesRun = 1;
    isRunning = true;

    if (controller.isAnimating) {
      return;
      //controller.stop(canceled: true);
    } else {
      controller.reverse(
          from: controller.value == 0.0 ? 1.0 : controller.value);
    }
  }

// Pause the timer animation
  pauseTimer() {
    if (controller.isAnimating) {
      controller.stop(canceled: true);
    } else {
      return;
    }
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
