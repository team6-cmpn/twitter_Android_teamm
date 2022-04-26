// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:twitter_app/screens/Login/background_for_login_screen.dart';
import 'package:twitter_app/components/text_field_container.dart';

import '../../components/rounded_button.dart';
import '../home/Timeline.dart';
import '../../model/text_field_validation.dart';

class BodyForSignUpScreen extends StatelessWidget {
  BodyForSignUpScreen({
    Key key,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();
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
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFieldContainer(
                  validator: (value) => nameValidator.validate(value),
                  size: size,
                  titleText: '  Name',
                  passedOnChanged: (value) {},
                ),
                TextFieldContainer(
                  validator: (value) => emailValidator.validate(value),
                  size: size,
                  titleText: '  Email',
                  passedOnChanged: (value) {},
                ),
              ],
            ),
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
            passedOnChanged: (value) {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime.now(),
              );
            },
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          RoundedButton(
            passedText: 'Next',
            textColor: Colors.white,
            pressed: () {
              if (formKey.currentState.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TimelinePage(),
                  ),
                );
              }
            }, //addTransaction //() {},
            colorPassed: Colors.grey[700],
            marginValue: 3,
            roundedpassedcolor: Colors.grey,
            highlightPassedColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  /* Future addTransaction(String name, String passwordPassed) async {
    final transaction = Transaction()
      ..name = name
      ..createdDate = DateTime.now()
      ..passwordPassed = passwordPassed;

    final box = Boxes.getTransactions();
    box.add(transaction);
    //box.put('mykey', transaction);

    // final mybox = Boxes.getTransactions();
    // final myTransaction = mybox.get('key');
    // mybox.values;
    // mybox.keys;
  }
}
 */

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
      ) 
      */
}
