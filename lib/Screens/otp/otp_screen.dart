import 'package:flutter/material.dart';
import 'package:nash_mini/Screens/otp/otp_body.dart';

import '../../constants.dart';

class OtpVerificationScreen extends StatelessWidget {
  static String routeName = "/otp";

  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OTP Verification',
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
