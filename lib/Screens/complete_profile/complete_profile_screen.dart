import 'package:flutter/material.dart';
import 'package:nash_mini/Screens/complete_profile/complete_profile_body.dart';

import '../../constants.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";

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
