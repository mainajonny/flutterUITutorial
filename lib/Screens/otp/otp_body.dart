import 'package:flutter/material.dart';
import 'package:nash_mini/Screens/otp/otp_form.dart';

import '../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    'Verify Your OTP',
                    style: headingStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'An OTP has been sent to +254 717 268 851',
                    textAlign: TextAlign.center,
                  ),
                  buildTimer(),
                  SizedBox(
                    height: 100,
                  ),
                  OtpForm(),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO resend OTP function
                    },
                    child: Text(
                      'Resend OTP code',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'This code will expire in: ',
        ),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 30.0, end: 0),
          duration: Duration(seconds: 30), //Give OTP service 30sec
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {
            //TODO resend OTP function
          },
        ),
      ],
    );
  }
}
