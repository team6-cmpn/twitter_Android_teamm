import 'package:flutter/material.dart';
import 'package:twitter_app/screens/Settings/NotificationsPage/allnotifications.dart';
import 'package:twitter_app/screens/Settings/NotificationsPage/likes.dart';

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldkey,
          appBar: AppBar(
            toolbarHeight: 50,
            elevation: 1,
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(
            //       Icons.settings,
            //     ),
            //     onPressed: () => Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => NotificationSettingsPage()),
            //     ),
            //   ),
            // ],
            centerTitle: false,
            title: Text(
              "Notifications",
              style: TextStyle(fontSize: 20),
            ),

            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            bottom: TabBar(
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Likes'),
              ],
              labelColor: Colors.blueAccent,
            ),
          ),
          body: TabBarView(
            children: [
              AllNotificationsPage(),
              LikesNotificationsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
