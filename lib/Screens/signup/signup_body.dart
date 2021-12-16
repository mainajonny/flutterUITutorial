import 'package:flutter/material.dart';
import 'package:nash_mini/Screens/login/login_screen.dart';
import 'package:nash_mini/Screens/signup/signup_form.dart';
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
                'Welcome to Nash',
                style: headingStyle,
              ),
              Text(
                'Your ultimate financial partner',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              SignUpForm(),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Already have an account?  ",
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, LogInScreen.routeName);
                  },
                  child: Text(
                    'SignIn',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                      icon: 'assets/svg/google-icon.svg', pressed: () {}),
                  SocialCard(icon: 'assets/svg/facebook-2.svg', pressed: () {}),
                  SocialCard(icon: 'assets/svg/twitter.svg', pressed: () {}),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'By continuing you confirm that you agree with our ',
                textAlign: TextAlign.center,
              ),
              Text(
                'Terms and Conditions',
                style: TextStyle(color: Colors.blue),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
