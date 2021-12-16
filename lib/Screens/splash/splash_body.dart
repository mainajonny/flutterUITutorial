import 'package:flutter/material.dart';
import 'package:nash_mini/Models/splash_data.dart';
import 'package:nash_mini/Screens/signup/signup_screen.dart';
import '../../Constant_components/default_button.dart';
import 'package:nash_mini/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                    title: splashData[index].title,
                    text: splashData[index].text,
                    image: splashData[index].image),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length, (index) => buildDot(index: index)),
                    ),
                    Spacer(
                      flex: 893,
                    ),
                    Visibility(
                      //to prevent dots from moving up and down when button appers
                      replacement: Container(
                        child: Spacer(),
                      ),
                      //getting last index and setting button visibility
                      visible:
                          currentPage == splashData.length - 1 ? true : false,
                      child: DefaultButtton(
                          text: 'Continue',
                          pressed: () {
                            Navigator.pushNamed(
                                context, SignUpScreen.routeName);
                          }),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Colors.black38,
          borderRadius: BorderRadius.circular(3)),
    );
  }
}

class SplashContent extends StatelessWidget {
  final String title, text, image;

  const SplashContent({
    Key? key,
    required this.title,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          title,
          style: TextStyle(
              fontSize: 30,
              color: kTextColorPurple,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: 265,
          width: 235,
        )
      ],
    );
  }
}
