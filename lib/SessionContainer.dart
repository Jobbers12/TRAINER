import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trainer/models/ActivityModel.dart';
import 'package:trainer/routes/Session.dart';

class SessionContainer extends StatefulWidget {
  final String goalName;
  final bool sessionRunning;
  final List<ActivityModel> activities;

  SessionContainer({
    this.goalName,
    this.sessionRunning,
    this.activities,
  });

  @override
  _SessionContainerState createState() => _SessionContainerState();
}

class _SessionContainerState extends State<SessionContainer>
    with TickerProviderStateMixin {
  AnimationController controller;
  bool isRunning = false;

  List<int> activityTimes;
  int activitiesRun;
  int activitiesTotal;

  String get timerString {
    if (widget.activities.length == 0) { return ''; }
    Duration duration = controller.duration * controller.value;
    if (isRunning == true) {
      return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    }
    return '...';
  }

  @override
  void initState() {
    super.initState();
    if (widget.activities.length == 0) {
      return;
    }
    activityTimes = widget.activities.map((e) => e.activityTime).toList();
    activitiesTotal = activityTimes.length;

    // Set inital time (first activity)
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: activityTimes[0] + 1),
    );

    // Listen for when current timer finishes and start a new one with the next activity time
    controller.addStatusListener(
      (AnimationStatus status) {
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
      },
    );

    // Update state each tick with the current timer time
    controller.addListener(() {
      setState(() {
        timerString;
      });
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
    return Session(
      goalName: widget.goalName,
      sessionRunning: widget.sessionRunning,
      activities: widget.activities,
      onBackPressed: () => _onBack(),
      onStartPressed: () => _onStart(),
      onPausePressed: () => _onPause(),
      controller: controller,
      timerString: timerString,
      sessionName: _getSessionName().toString(),
    );
  }

    // Handles press of the start button
  void _onStart() {
    print('start pressed');
    activitiesRun = 1;
    isRunning = true;

    if (controller.isAnimating) {
      return;
    } else {
      controller.reverse(
          from: controller.value == 0.0 ? 1.0 : controller.value);
    }
  }

  // Handles press of the pause button
  void _onPause() {
    print('pause pressed');
    if (controller.isAnimating) {
      controller.stop(canceled: true);
    } else {
      return;
    }
  }

  // Handles press of the back/cancel button
  void _onBack() {
    Navigator.pop(context);
  }
  
  // Returns the name of the session using the day
  String _getSessionName() {
    var day = DateTime.now();

    String dayName = DateFormat('EEEE').format(day);

    return dayName + ' Session';
  }
}
