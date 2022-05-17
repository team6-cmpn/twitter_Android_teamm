import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'deactivateaccpage.dart';

import '../../home/Timeline.dart';
import '../displaysettingspage.dart';
import '../notificationsettings.dart';
import '../searchsettingspage.dart';
import '../testpage.dart';
import 'accountinfopage.dart';
import 'changepasspage.dart';

class YourAccountPage extends StatefulWidget {
  @override
  State<YourAccountPage> createState() => _YourAccountPageState();
}

class _YourAccountPageState extends State<YourAccountPage> {
  String lxrdtoken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyODAxZDc2OGRiY2FiZDhmNTFlNTVhMyIsImlzRGVhY3RpdmF0ZWQiOmZhbHNlLCJpYXQiOjE2NTI3MTc0OTgsImV4cCI6MTcwOTI4MzE1NH0.ynk6A5ZwY6VV6uzKEJfMKpWfMr2M6j-XyiH0g57JGQ4';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => {Navigator.of(context).pop()},
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 1,
        centerTitle: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Account",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "@Username",
              style: TextStyle(fontSize: 15.0),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 400,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "See information about your account, change your password, or learn about your account deactivation.",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 30,
                    ),
                    title: Text('Account information'),
                    subtitle: Text('See information about your account'),
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountInfoPage())),
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.lock,
                      size: 30,
                    ),
                    title: Text('Change your password'),
                    subtitle: Text('Change your password at anytime'),
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResetPasswordPage(lxrdtoken))),
                    },
                  ),
                  ListTile(
                    minVerticalPadding: 20,
                    leading: Icon(
                      Icons.heart_broken,
                      size: 30,
                    ),
                    title: Text('Deactivate Account'),
                    subtitle:
                        Text('Find out how you can deactivate your account'),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeactivateAccountPage())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
