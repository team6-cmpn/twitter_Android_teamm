import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../home/Timeline.dart';
import '../displaysettingspage.dart';
import '../notificationsettings.dart';
import '../searchsettingspage.dart';
import '../testpage.dart';
import 'accountinfopage.dart';

class YourAccountPage extends StatefulWidget {
  @override
  State<YourAccountPage> createState() => _YourAccountPageState();
}

class _YourAccountPageState extends State<YourAccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => {Navigator.of(context).pop()},
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Account",
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
              Text(
                "@Username",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 15.0),
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            Container(
              width: 400,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "See information about your account, change your password, or learn about your account deactivation",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 15.0),
                ),
              ),
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
                    onTap: () => {},
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
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TestPage())),
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
