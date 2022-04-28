// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final String titleText;
  final double sizePassed;
  var validator;
  final nameController = TextEditingController();
  //final passwordController = TextEditingController();
  final ValueChanged<String> passedOnChanged;
  final Function TapeddFunction;
  bool obs;
  TextFieldContainer({
    Key key,
    this.titleText,
    this.passedOnChanged,
    this.TapeddFunction,
    this.sizePassed,
    this.size,
    this.validator,
    this.obs,
    //this.emailController
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: size.width * 0.83, //0.78
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            //width: size.width * 0.1,
          ),
        ),
        child: TextFormField(
          obscureText: obs,
          validator: validator,
          onTap: () => TapeddFunction,

          controller: nameController,
          onChanged: passedOnChanged,
          decoration: InputDecoration(
            labelText: titleText

            //'  Phone, email, or username',
            ,
            /* icon: Icon(
                Icons.person,
                color: Colors.lightBlue,
              ) */
            //hintText: 'ssuuu',
          ),

          //maxLengthEnforced: false,
        ),
      ),
    );
  }
}

/* @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        
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
  } */