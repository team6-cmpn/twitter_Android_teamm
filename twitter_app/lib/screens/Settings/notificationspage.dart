import 'package:flutter/material.dart';
import '../../components/widgets/sidemenu.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'notificationsettings.dart';

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
          toolbarHeight: 50,
          elevation: 1,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotificationSettingsPage()),
              ),
            ),
          ],
          centerTitle: false,
          title: Text(
            "Notifications",
          ),
          leading: IconButton(
              onPressed: () {
                scaffoldkey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.person,
              )),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
      ),
    );
  }
}
