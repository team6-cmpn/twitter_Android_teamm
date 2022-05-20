import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../components/rounded_button.dart';
import '../../components/text_field_container.dart';
import '../../components/widgets/CustomNavBar2.0.dart';

// ignore: use_key_in_widget_constructors
class VerificationBody extends StatefulWidget {
  VerificationBody({
    Key key,
    String token,
  }) : super(key: key);

  @override
  State<VerificationBody> createState() => _VerificationBodyState();
}

class _VerificationBodyState extends State<VerificationBody> {
  final formKey = GlobalKey<FormState>();

  TextEditingController verificationController = new TextEditingController();
  String token;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 5,
                //left: size.width * 0.4,
                child: Image.asset(
                  'assests/images/FinalLogo.png',
                  width: size.width * 0.09,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Verification Code',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      height: 5.5,
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: TextFieldContainer(
                      obs: false,
                      size: size,
                      titleText: '  Enter your 6 number code',
                      passedOnChanged: (value) {},

                      //validator: (value) => emailValidator.validate(value),
                      nameController: verificationController,
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  RoundedButton(
                    passedText: 'Next',
                    textColor: Colors.white,
                    pressed: () {
                      verificationIntegerate(
                          verificationController.text, token);
                    }, //addTransaction //() {},
                    colorPassed: Colors.blue,
                    marginValue: 3,
                    roundedpassedcolor: Colors.grey,
                    highlightPassedColor: Colors.grey,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  // ignore: avoid_unnecessary_containers
                  SizedBox(
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        Text(
                          'Didn\'t recieve email ?',
                          style: TextStyle(
                            fontSize: 13, color: Colors.grey[700],
                            //height: 5.5,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            verificationIntegerate(
                                verificationController.text, token);
                          },
                          child: Text(
                            ' Resend',
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
            ],
          ),
        ),
      ),
    );
  }

  verificationIntegerate(
    String theCodeThatPassed,
    String token,
  ) async {
    Map data = {
      'verificationCode': theCodeThatPassed,
    };
    //var jsonData = null;
    Map mapResponse;
    Map dataResponse;
    var response = await http.post(
      Uri.parse("http://twi-jay.me:8080/auth/confirmation"),
      body: data,
    );
    //headers:token;
    print('we r here');
    if (response.statusCode == 200) {
      mapResponse = json.decode(response.body);
      dataResponse = mapResponse;
      token = dataResponse["emailtoken"];
      setState(
        () {
          //dataResponse = mapResponse["data"];
          //dataResponse["role"].toString() == 'Admin'
          print('zuuuuuuuperrrrrrrr');
          print(token);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => CustomNavBar()),
              (Route<dynamic> route) => false);
          dataResponse = mapResponse;
        },
      );
    } else if (response.statusCode == 400) {
      print('bad request');
    } else if (response.statusCode == 401) {
      print('Unauthorized');
    } else if (response.statusCode == 404) {
      print('Not Found');
    } else if (response.statusCode == 500) {
      print('Internal Server Error');
    }
  }
}
