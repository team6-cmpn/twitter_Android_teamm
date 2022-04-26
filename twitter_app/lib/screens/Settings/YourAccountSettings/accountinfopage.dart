import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../home/Timeline.dart';
import '../displaysettingspage.dart';
import '../notificationsettings.dart';
import '../searchsettingspage.dart';
import '../testpage.dart';

class AccountInfoPage extends StatefulWidget {
  @override
  State<AccountInfoPage> createState() => AccountInfoPageState();
}

class AccountInfoPageState extends State<AccountInfoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
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
                "Account information",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "@Username",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    title: Text('Username'),
                    subtitle: Text('@Username'),
                    onTap: () => {},
                  ),
                  ListTile(
                    title: Text('Email'),
                    subtitle: Text('example@gmail.com'),
                    onTap: () => {},
                  ),
                  ListTile(
                    minVerticalPadding: 20,
                    title: Text(
                      'Log out',
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Log out'),
                        content: const Text(
                            'Logging out will remove all Twitter data from this device'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Log out'),
                            child: const Text('Log out'),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
