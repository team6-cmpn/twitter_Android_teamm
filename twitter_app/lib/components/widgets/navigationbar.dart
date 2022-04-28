import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../screens/Settings/notificationspage.dart';
import '../../screens/Settings/settingspage.dart';
import '../../screens/home/Timeline.dart';

void main() {
  runApp(CustomNavBar());
}

class CustomNavBar extends StatefulWidget {
  static final title = 'salomon_bottom_bar';

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  var _currentIndex = 0;

  List<Widget> pages = [
    TimelinePage(),
    NotificationsPage(),
    SettingsPage(),
    Text("Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: pages[_currentIndex],
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.blueAccent,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.notifications),
              title: Text("NOtifications"),
              selectedColor: Colors.blueAccent,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.settings),
              title: Text("Settings"),
              selectedColor: Colors.blueAccent,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
