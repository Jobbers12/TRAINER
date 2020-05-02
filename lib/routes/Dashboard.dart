import 'package:flutter/material.dart';
import 'package:trainer/mocks/MockImages.dart';
import 'package:trainer/styles/Styles.dart';

class Dashboard extends StatelessWidget {
  final String userName;

  Dashboard({
    this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: Styles.globalPagePadding,
        color: Styles.backgroundColor,
        child: Column(
          // Main page column
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: Styles.headingPadding,
                  child: Text('Dashboard', style: Styles.headerLarge),
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: ListView(
                children: [_greetingCard()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Welcome back card @ top of page
  Widget _greetingCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Image.network(MockImages.greetingImage),
                Positioned(
                  bottom: 8.0,
                  right: 8.0,
                  child:
                      Text(_greeting() + userName, style: Styles.headerMedium),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Return greeting based on local time of day
  String _greeting() {
    var hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good morning, ';
    }
    if (hour < 18) {
      return 'Good afternoon, ';
    }
    return 'Good evening, ';
  }
}
