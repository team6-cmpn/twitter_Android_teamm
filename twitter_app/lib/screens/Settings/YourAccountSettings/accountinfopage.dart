import 'package:flutter/material.dart';
import 'package:twitter_app/screens/welcome/welcome_screen.dart';
import '../../../API/userdata.dart';

class AccountInfoPage extends StatefulWidget {
  @override
  State<AccountInfoPage> createState() => AccountInfoPageState();
}

class AccountInfoPageState extends State<AccountInfoPage> {
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
              "Account information",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              userdata.username,
              style: TextStyle(fontSize: 15.0),
            )
          ],
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
                    subtitle: Text(userdata.username),
                    onTap: () => {},
                  ),
                  ListTile(
                    title: Text('Email'),
                    subtitle: Text(userdata.email),
                    onTap: () => {},
                  ),
                  ListTile(
                    title: Text('Phone number'),
                    subtitle: userdata.phonenum == ""
                        ? Text("No phone number registered")
                        : Text(userdata.phonenum),
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
                              onPressed: () {
                                userdata.token = null;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WelcomeScreen(),
                                  ),
                                );
                              },
                              child: Text("Log out")),
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
