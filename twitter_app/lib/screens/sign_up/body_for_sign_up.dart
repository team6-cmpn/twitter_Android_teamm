// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:twitter_app/screens/Login/background_for_login_screen.dart';
import 'package:twitter_app/screens/text_field_container.dart';

class BodyForSignUpScreen extends StatelessWidget {
  const BodyForSignUpScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackGroundForLoginScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create your account',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 5.5,
            ),
          ),
          TextFieldContainer(
            size: size,
            titleText: '  Name',
            passedOnChanged: (value) {},
          ),
          TextFieldContainer(
            size: size,
            titleText: '  Email',
            passedOnChanged: (value) {},
          ),
          SizedBox(
            //height: size.height,
            width: size.width * 0.9,
            height: 70,
          ),
          Text(
            'Date of birth',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          Text(
            'This will not be shown publicly. Confirm your own age',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              //fontWeight: FontWeight.bold,
              //height: 5.5,
            ),
          ),
          Text(
            'even if this account is for a business, a pet, or     ',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
          Text(
            'something else.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(
            //height: size.height,
            width: size.width * 0.9,
            height: 10,
          ),
          TextFieldContainer(
            size: size,
            titleText: '  Date of birth',
            passedOnChanged: (value) {},
          ),
        ],
      ),
    );
  }
}


/* SizedBox(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 25,
              //left: size.width * 0.4,
              child: Image.asset(
                'assests/images/mockingay2.png',
                width: size.width * 0.2,
              ),
            ),
          ],
        ),
      ) */