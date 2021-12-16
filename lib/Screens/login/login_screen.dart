import 'package:flutter/material.dart';
import 'package:nash_mini/Screens/login/login_body.dart';

import 'package:nash_mini/constants.dart';

class LogInScreen extends StatelessWidget {
  static String routeName = "/log_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
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
