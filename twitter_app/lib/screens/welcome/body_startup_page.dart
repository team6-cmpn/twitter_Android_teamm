// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_app/screens/login/login.dart';

import '../../components/google_rounded_button.dart';
import '../../components/google_sign_in.dart';
import '../sign_up/sign_up.dart';
import 'background.dart';
import '../../components/rounded_button.dart';

//import 'package:sign_button/sign_button.dart';
//import 'package:twitter_app/API/google_signIn_api.dart';

class BodyStartUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    //this size provide the total height and width of the screen

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        //verticalDirection: VerticalDirection.down,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'Happening now',
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 4),
          ),
          Text(
            'Join Twitter today.',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1,
            ),
          ),
          GoogleRoundedButton(
            passedText: 'Sign up with Google',
            roundedPassedColor: Colors.grey,
            textColor: Colors.black,
            pressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
            //colorPassed: Colors.grey,
            marginValue: 5,
          ),
          /* SignInButton.mini(
            buttonType: ButtonType.google,
            //onPressed: signIn, //() => {},
          ),
          RoundedButton(
            passedText: 'Sign up with Apple',
            textColor: Colors.black,
            pressed: () {},
            colorPassed: Colors.grey,
            marginValue: 3,
          ), */

          /* MaterialButton(
            minWidth: size.width * 0.86,
            height: 45,
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>  LoginPage(),
              //         ),
              //         );
            },
            //defining the Shape
            shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                borderRadius: BorderRadius.circular(40)),

            child: const Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ), */

          Container(
            padding: EdgeInsets.all(5),
            width: size.width * 0.86,
            child: Row(
              children: const [
                Text(
                  '----------------------------- ',
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
          ),
          SizedBox(),
          /* Container(
            height: 70,
            width: 290,
            child: Card(
              color: Colors.amber,
              child: Text('3ez is ..........'),
            ),
          ), */
          RoundedButton(
            passedText: 'Sign Up with Email',
            textColor: Colors.white,
            pressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
            colorPassed: Colors.lightBlue,
            roundedpassedcolor: Colors.lightBlue,
            marginValue: 3,
          ),
          /* Text(
            'By signing up , you agree to the Terms of Service and Privace Policy, including Cookie Use ',
            style: TextStyle(
              fontSize: 10,
              //fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 7,
            ),
          ), */
          SizedBox(
            height: size.height * 0.2,
          ),
          Text(
            'Already have an account?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 3,
            ),
          ),
          RoundedButton(
            passedText: 'Sign in',
            textColor: Colors.lightBlue,
            marginValue: 3,
            pressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
            colorPassed: Colors.white,
            roundedpassedcolor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
