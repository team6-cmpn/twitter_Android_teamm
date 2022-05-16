import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<changepassword> ChangePassword(
  String currentPassword,
  String password,
  String confirmNewPassword,
  String token,
) async {
  Map bodydata = {
    "currentPassword": currentPassword,
    "password": password,
    "confirmNewPassword": confirmNewPassword
  };
  Map headerdata = {
    "x-access-token": token,
  };
  const String BaseURL = 'http://twi-jay.me:8080';
  final response = await http.post(
      Uri.parse('$BaseURL/settings/changePassword'),
      headers: headerdata,
      body: bodydata);

  if (response.statusCode == 200) {
    changepassword.fromJson(jsonDecode(response.body));
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
