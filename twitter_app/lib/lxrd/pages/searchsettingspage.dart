import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class SearchSettingsPage extends StatefulWidget {
  @override
  State<SearchSettingsPage> createState() => _SearchSettingsPageState();
}

class _SearchSettingsPageState extends State<SearchSettingsPage> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.topCenter,
          child: Text(
            "Try searching for password reset, notifications, etc",
            style:
                TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6)),
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Search settings',
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
