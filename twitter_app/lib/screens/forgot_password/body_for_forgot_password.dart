// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../components/rounded_button.dart';
import '../Login/background_for_login_screen.dart';
import '../text_field_container.dart';

// ignore: use_key_in_widget_constructors
class BodyForForgotPassword extends StatelessWidget {
  //const BodyForForgotPassword({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackGroundForLoginScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Find your Twitter account',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 5.5,
            ),
          ),
          TextFieldContainer(
            size: size,
            titleText: '  Enter your email, phone number, or username',
            passedOnChanged: (value) {},
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: size.height * 0.5,
          ),
          RoundedButton(
            passedText: 'Search',
            textColor: Colors.white,
            pressed: () {},
            colorPassed: Colors.grey[700],
            marginValue: 3,
            roundedpassedcolor: Colors.grey,
            highlightPassedColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
