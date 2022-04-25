import 'package:flutter/material.dart';
import '../pages/notificationsettings.dart';
import '../widgets/navigationbar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../widgets/sidemenu.dart';

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        drawer: SideMenu(),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings, color: Colors.black),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotificationSettingsPage()),
              ),
            ),
          ],
          centerTitle: false,
          title: Text("Notifications", style: TextStyle(color: Colors.black)),
          leading: IconButton(
              onPressed: () {
                scaffoldkey.currentState?.openDrawer();
              },
              icon: Icon(Icons.person, color: Colors.black)),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
