import 'package:flutter/material.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../pages/testpage.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  var _currentIndex = 0;
  var _page = 0;
  List<Widget> pages = [
    TestPage(),
    TestPage(),
    TestPage(),
    TestPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
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
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.blueAccent,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.notifications_rounded),
            title: Text("Notifications"),
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
    );
  }

  void _handlclick(int index) {
    setState(() {
      _page = index;
    });
  }
}
