import 'package:flutter/material.dart';
import 'package:twitter_app/screens/Settings/NotificationsPage/allnotifications.dart';
import 'package:twitter_app/screens/Settings/NotificationsPage/likes.dart';
import 'package:twitter_app/screens/Settings/searchsettingspage.dart';
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
    return DefaultTabController(
      length: 2,
      child: SafeArea(
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
            leading: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://previews.123rf.com/images/koblizeek/koblizeek2001/koblizeek200100050/138262629-usuario-miembro-de-perfil-de-icono-de-hombre-vector-de-s%C3%ADmbolo-perconal-sobre-fondo-blanco-aislado-.jpg'),
                  radius: 16,
                ),
              ),
              onTap: () {
                scaffoldkey.currentState?.openDrawer();
              },
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
