import 'package:flutter/material.dart';
import 'package:twitter_app/screens/Settings/searchsettingspage.dart';
import '../../../components/widgets/sidemenu.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class LikesNotificationsPage extends StatefulWidget {
  LikesNotificationsPage({Key key}) : super(key: key);

  @override
  State<LikesNotificationsPage> createState() => _LikesNotificationsPageState();
}

class _LikesNotificationsPageState extends State<LikesNotificationsPage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Text("Damn")),
      ),
    );
  }
}
