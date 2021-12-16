import 'package:flutter/material.dart';

import '../../constants.dart';
import 'complete_profile_form.dart';

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
          child: Column(
            children: [
              Text(
                "We're almost there",
                style: headingStyle,
              ),
              Text(
                'Your ultimate financial partner',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              CompleteProfileForm(),
              SizedBox(
                height: 30,
              ),
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
