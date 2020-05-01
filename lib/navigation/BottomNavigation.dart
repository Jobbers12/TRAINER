import 'package:flutter/material.dart';
import 'package:trainer/routes/Dashboard.dart';
import 'package:trainer/routes/Settings.dart';
import 'package:trainer/routes/Training.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final String userName;

  _BottomNavigationState({
    this.userName,
  });

  int _currentIndex = 0;

  // List of pages (widgets). Indexed for order
  final List<Widget> _children = [
    Dashboard(userName: userName),
    Training(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
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
