import 'package:flutter/material.dart';
import '../../../components/rounded_button.dart';
import '../../forgot_password/FogotPassword.dart';

import 'package:http/http.dart' as http;
import 'package:twitter_app/components/widgets/CustomNavBar2.0.dart';
import 'dart:convert';
import 'dart:async';

Future<int> ChangePasswordApi(
  var currentPassword,
  var password,
  var confirmNewPassword,
  String token,
) async {
  Map responsedata;
  Map<String, dynamic> bodydata = {
    "currentPassword": currentPassword,
    "password": password,
    "confirmNewPassword": confirmNewPassword
  };
  // Map headerdata = {
  //   "x-access-token": token,
  // };
  const String BaseURL = "http://twi-jay.me:8080";

  final response = await http.post(
      Uri.parse("$BaseURL/settings/changePassword"),
      headers: {"x-access-token": token},
      body: json.encode(bodydata));
  print(bodydata);
  print(response.body);

  if (response.statusCode == 200) {
    responsedata = (jsonDecode(response.body));
    print(responsedata);
  } else if (response.statusCode == 400) {
    print('bad request');
  } else if (response.statusCode == 401) {
    print('Unauthorized');
  } else if (response.statusCode == 404) {
    print('Not Found');
  } else if (response.statusCode == 500) {
    print('Internal Server Error');
  } else
    print("fail");
  return (response.statusCode);
}

class changepassword {
  String currentPassword;
  String password;
  String confirmNewPassword;

  changepassword(
      {this.currentPassword, this.password, this.confirmNewPassword});

  changepassword.fromJson(Map<String, dynamic> json) {
    currentPassword = json['currentPassword'];
    password = json['password'];
    confirmNewPassword = json['confirmNewPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPassword'] = this.currentPassword;
    data['password'] = this.password;
    data['confirmNewPassword'] = this.confirmNewPassword;
    return data;
  }
}

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage(
    String lxrdtoken,
  );

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final CurrentPassword = TextEditingController();
  final NewPassword = TextEditingController();
  final ConfirmPassword = TextEditingController();
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyODAxZDc2OGRiY2FiZDhmNTFlNTVhMyIsImlzRGVhY3RpdmF0ZWQiOmZhbHNlLCJpYXQiOjE2NTI3Mjk1MTIsImV4cCI6MTcwOTI5NTE2OH0.5OwunlauRpttWHvCKdVYzBUj9-bMBtGVwbS0X64xg8Q";
  //String token = widget.lxrdtoken;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    CurrentPassword.dispose();
    NewPassword.dispose();
    ConfirmPassword.dispose();
    super.dispose();
  }

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
                "@Username",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10, left: 20, right: 40),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: "Current password",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          style: TextStyle(fontSize: 20),
                          controller: CurrentPassword,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              labelText: "New password",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                              hintText: "At least 8 characters"),
                          style: TextStyle(fontSize: 20),
                          controller: NewPassword,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              labelText: "Confirm new password",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                              hintText: "At least 8 characters"),
                          style: TextStyle(fontSize: 20),
                          controller: ConfirmPassword,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 60,
                          width: 200,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.3, 1],
                              colors: [
                                Color.fromARGB(255, 36, 134, 245),
                                Color.fromARGB(255, 14, 145, 221),
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(45),
                            ),
                          ),
                          child: SizedBox.expand(
                            child: TextButton(
                                child: Text(
                                  "Update password",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  ChangePasswordApi(
                                      CurrentPassword.text,
                                      NewPassword.text,
                                      ConfirmPassword.text,
                                      token);
                                }),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen(),
                                ),
                              );
                            },
                            child: Text("Forgot your password?")),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ChangePasswordIntegrate(
    String CurrentPasswordPassed,
    String NewPasswordPassed,
    String ConfirmPasswordPassed,
    String token,
  ) async {
    // Map<String, dynamic> headerdata = {
    //   "x-access-token": token,
    // };
    Map<String, dynamic> data = {
      "currentPassword": CurrentPasswordPassed,
      "password": NewPasswordPassed,
      "confirmNewPassword": ConfirmPasswordPassed
    };
    //var jsonData = null;
    const String BaseURL = "http://twi-jay.me:8080";

    Map mapResponse;
    Map dataResponse;
    var response = await http.post(
        Uri.parse("http://twi-jay.me:8080/settings/changePassword"),
        headers: {"x-access-token": token},
        body: json.encode(data));
    print(data);
    print("Waiting");
    if (response.statusCode == 200) {
      mapResponse = json.decode(response.body);
      dataResponse = mapResponse;
      token = dataResponse["accessToken"];
      setState(
        () {
          //dataResponse = mapResponse["data"];
          //dataResponse["role"].toString() == 'Admin'
          print('Success');
          print(token);

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
