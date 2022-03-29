// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import '../../components/google_rounded_button.dart';
import '../../components/or_divider_line.dart';

import '../../components/rounded_button.dart';
import '../text_field_container.dart';
import '../welcome/welcome_screen.dart';
import 'background_for_login_screen.dart';

class BodyForLoginScreen extends StatelessWidget {
  const BodyForLoginScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackGroundForLoginScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'Sign in to Twitter',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              height: 5.5,
            ),
          ),
          GoogleRoundedButton(
            passedText: 'Sign in with Google',
            textColor: Colors.black,
            pressed: () {},
            colorPassed: Colors.grey,
            marginValue: 7,
          ),
          RoundedButton(
            passedText: 'Sign in with Apple',
            textColor: Colors.black,
            pressed: () {},
            colorPassed: Colors.grey,
            marginValue: 3,
          ),
          /* Container( //Or_divider_container_me
            padding: EdgeInsets.all(5),
            width: size.width * 0.8,
            child: Row(
              children: const [
                Text(
                  '------------------------- ',
                  style: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.w100,
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
                Text(
                  'or',
                  style: TextStyle(
                    fontSize: 15,
                    //fontWeight: FontWeight.w100,
                    color: Colors.black,
                    //height: 1,
                  ),
                ),
                Text(
                  ' ----------------------------',
                  style: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.w100,
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
              ],
            ),
          ), */
          OrDivider(),
          TextFieldContainer(
            size: size,
            titleText: '  Phone, email, or username',
            passedOnChanged: (value) {},
          ),
          RoundedButton(
            passedText: 'Next',
            textColor: Colors.white,
            pressed: () {},
            colorPassed: Colors.black,
            marginValue: 14,
            highlightPassedColor: Colors.white24,
          ),
          RoundedButton(
            passedText: 'Forgot password?',
            textColor: Colors.black,
            pressed: () {},
            colorPassed: Colors.grey,
            marginValue: 3,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          SizedBox(
            width: size.width * 0.8,
            child: Row(
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 13, color: Colors.grey[700],
                    //height: 5.5,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WelcomeScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    ' Sign up',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blueAccent,
                    ),
                  ),
                )
              ],
            ),
          ),
          /* Image.asset(
            'assests/icons/googlesvg.png',
            height: 50,
            width: 50,
          ), */
        ],
      ),
    );
  }
}

/* class TextFieldContainer extends StatelessWidget {
  final String titleText;
  final ValueChanged<String> passedOnChanged;
  const TextFieldContainer({
    Key key,
    this.titleText,
    this.passedOnChanged,
    this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        //padding: EdgeInsets.all(0),
        //margin: EdgeInsets.all(0),
        width: size.width * 0.78,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            //width: size.width * 0.1,
          ),
        ),
        child: TextField(
          onChanged: passedOnChanged,
          decoration: InputDecoration(
              labelText: titleText //'  Phone, email, or username',
              ,
              icon: Icon(
                Icons.person,
                color: Colors.lightBlue,
              )
              //hintText: 'ssuuu',
              ),

          //maxLengthEnforced: false,
        ),
      ),
    );
  }
}
 */