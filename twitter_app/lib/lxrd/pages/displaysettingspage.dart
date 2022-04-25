// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import '../widgets/change_theme_button_widget.dart';
import '../widgets/navigationbar.dart';
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          elevation: 3,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
                width: 0,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text("Dark Mode:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Text(
                        "Choose app theme",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          // color: Colors.black
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  ChangeThemeButtonWidget(),
                ],
              ),
              Row()
            ],
          ),
        ),
      ),
    );
  }
}
