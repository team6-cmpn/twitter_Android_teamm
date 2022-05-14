import 'package:flutter/material.dart';
import 'package:twitter_app/screens/Settings/searchsettingspage.dart';
import '../../../components/widgets/sidemenu.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class AllNotificationsPage extends StatefulWidget {
  AllNotificationsPage({Key key}) : super(key: key);

  @override
  State<AllNotificationsPage> createState() => _AllNotificationsPageState();
}

class _AllNotificationsPageState extends State<AllNotificationsPage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Text("Damn2.0")),
      ),
    );
  }
}
