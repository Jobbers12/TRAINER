import 'package:flutter/material.dart';
import 'package:trainer/models/GoalModel.dart';
import 'package:trainer/routes/Dashboard.dart';
import 'package:trainer/routes/Settings.dart';
import 'package:trainer/routes/Training.dart';

class BottomNavigation extends StatefulWidget {
  final String userName;
  final List<GoalModel> goals;

  BottomNavigation({
    this.userName,
    this.goals,
  });

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex;

  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List of pages (widgets). Indexed for order
    final List<Widget> _children = [
      Dashboard(userName: widget.userName),
      Training(goals: widget.goals),
      Settings(),
    ];

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Dashboard'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            title: Text('Training'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          )
        ],
      ),
    );
  }

  // Set State when new tab is pressed
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
