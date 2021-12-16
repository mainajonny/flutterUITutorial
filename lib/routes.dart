import 'package:flutter/widgets.dart';
import 'package:nash_mini/Screens/Bloc/BlocTest.dart';
import 'package:nash_mini/Screens/complete_profile/complete_profile_screen.dart';
import 'package:nash_mini/Screens/home/home_screen.dart';
import 'package:nash_mini/Screens/login/login_screen.dart';
import 'package:nash_mini/Screens/otp/otp_screen.dart';
import 'package:nash_mini/Screens/signup/signup_screen.dart';
import 'package:nash_mini/Screens/splash/splash_screen.dart';

//All our routes will ba available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  BlocTestScreen.routeName: (context) => BlocTestScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  LogInScreen.routeName: (context) => LogInScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpVerificationScreen.routeName: (context) => OtpVerificationScreen(),
};
