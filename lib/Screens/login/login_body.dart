import 'package:flutter/material.dart';
import 'package:nash_mini/Screens/login/login_form.dart';
import 'package:nash_mini/Screens/signup/signup_screen.dart';
import 'package:nash_mini/Constant_components/social_card.dart';
import 'package:nash_mini/constants.dart';

class Body extends StatefulWidget {
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
          child: Column(
            children: [
              Text(
                'Welcome back',
                style: headingStyle,
              ),
              Text(
                'Your ultimate financial partner',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              LogInForm(),
              SizedBox(
                height: 50,
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Don't have an account?  ",
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  },
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
