import 'package:flutter/material.dart';

const kPrimaryColorLight = Color(0xFFB388FF);
const kPrimaryColor = Color(0xFF7C4DFF);
const kPrimaryColorDark = Color(0xFF6200EA);

const kTextColorBlack = Color(0xFF000000);
const kTextColorGrey = Color(0xFF9E9E9E);
const kTextColorPurple = Color(0xFF7C4DFF);

const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFB388FF), Color(0xFF6200EA)]);

const kAnimationDuration = Duration(milliseconds: 200);

const headingStyle = TextStyle(
    fontSize: 25,
    color: kPrimaryColor,
    fontWeight: FontWeight.bold,
    height: 2.5);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kUserNameNullError = "Please Enter your username";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputBoxDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15),
  enabledBorder: otpOutlineInputBorder(),
  focusedBorder: otpOutlineInputBorder(),
  border: otpOutlineInputBorder(),
);

OutlineInputBorder otpOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.grey, width: 1.5),
  );
}

const String MIFOS_PASSWORD = "mifos:password";
const String CREDENTIALS = "jonny:qwerty";
