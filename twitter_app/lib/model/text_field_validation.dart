// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';

class emailValidator {
  emailValidator(String value);

  static String validate(String value)
  /* {
    if (value.isEmpty ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
      return "Enter correct email";
    } else {
      return null;
    }
  } */
  {
    if (value.isEmpty || !RegExp(r'^[a-z A-Z 0-9 @ .]').hasMatch(value)) {
      return "Enter correct email";
    } else {
      return null;
    }
  }
}

class nameValidator {
  nameValidator(String value);

  static String validate(String value) {
    if (value.isEmpty || !RegExp('[A-Za-z0-9_]').hasMatch(value)) {
      return "Enter correct name Alphabticals and underscore only";
    } else {
      return null;
    }
  }
}

class PassValidator {
  PassValidator(String value);

  static String validate(String value) {
    if (value.isEmpty || !RegExp(r'^[a-z A-Z 0-9 $]+$').hasMatch(value)) {
      return "Enter correct Password";
    } else {
      return null;
    }
  }
}

/* class ForgetPassFieldValidator {
  ForgetPassFieldValidator(String? value);

  static String? validate(String value) {
    if (value.isEmpty ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
      return "Enter correct email";
    } else {
      return null;
    }
  }
}

class DateOfBirthFieldValidator {
  DateOfBirthFieldValidator(String? value);
  static String? validate(String value) {
    if (value.isEmpty) {
      return 'Enter correct date of birth';
    } else {
      return null;
    }
  }
}

class VerifyEmailFieldValidator {
  VerifyEmailFieldValidator(String? value);

  static String? validate(String value) {
    if (value.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "Enter correct code";
    } else {
      return null;
    }
  }
}

class SetPassFieldValidator {
  SetPassFieldValidator(String? value);

  static String? validate(String value) {
    if (value.isEmpty || !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value)) {
      return "Enter correct Password";
    } else {
      return null;
    }
  }
}

class SetUsernameFieldValidator {
  SetUsernameFieldValidator(String? value);
  static String? validate(String value) {
    if (value.isEmpty || !RegExp(r'^[a-z A-Z 0-9]').hasMatch(value)) {
      return "Enter correct Username";
    } else {
      return null;
    }
  }
}
 */