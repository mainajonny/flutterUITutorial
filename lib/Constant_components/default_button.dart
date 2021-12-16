import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultButtton extends StatelessWidget {
  final String text;
  final Function() pressed;

  const DefaultButtton({Key? key, required this.text, required this.pressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: kPrimaryColor),
        onPressed: pressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
    );
  }
}
