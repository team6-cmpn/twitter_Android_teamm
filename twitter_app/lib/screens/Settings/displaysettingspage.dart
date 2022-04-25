// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DisplaySettingsPage extends StatefulWidget {
  DisplaySettingsPage({Key key}) : super(key: key);

  @override
  State<DisplaySettingsPage> createState() => _DisplaySettingsPageState();
}

class _DisplaySettingsPageState extends State<DisplaySettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Display settings",
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
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text(
                  "Dark Mode",
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
              Text(
                "/appstate",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 15.0),
              )
            ],
          ),

          //     SizedBox(
          //       width: 180,
          //     ),
          //     //ChangeThemeButtonWidget(),
          //   ],
          // ),
          // Row()
        ),
      ),
    );
  }
}
