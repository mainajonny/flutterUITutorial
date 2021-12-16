import 'package:flutter/material.dart';
import 'package:nash_mini/constants.dart';
import 'signup_body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
        ),
        centerTitle: true,
        backwardsCompatibility: true,
        backgroundColor: kPrimaryColorLight,
      ),
      body: Body(),
    );
  }
}
