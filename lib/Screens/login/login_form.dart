import 'package:flutter/material.dart';
import 'package:nash_mini/Api/Services/api_manager.dart';

import 'package:nash_mini/Models/auth_model.dart';
import 'package:nash_mini/Screens/home/home_screen.dart';
import '../../Constant_components/custom_suffix_icon.dart';
import '../../Constant_components/default_button.dart';
import '../../Constant_components/form_error.dart';
import '../../constants.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  late String username, password;
  final List<String> errors = [];
  late Future<AuthModel> _authModel;

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildUsernameFormField(),
            SizedBox(
              height: 30,
            ),
            buildPasswordFormField(),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              GestureDetector(
                onTap: () {
                  //Navigator.pushNamed(context, SignUpScreen.routeName);
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ]),
            SizedBox(
              height: 30,
            ),
            FormError(errors: errors),
            SizedBox(
              height: 30,
            ),
            DefaultButtton(
                text: 'Continue',
                pressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   _authModel = API_Manager()
                  //       .auth
                  //       .authenticateUser(password, username, context);
                  //   print('## ' + password + '  ' + username);
                  // }
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => username = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kUserNameNullError);
        }
        username = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kUserNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Username',
          hintText: '',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          contentPadding: EdgeInsets.all(18),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: 'assets/svg/User.svg')),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: '',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          contentPadding: EdgeInsets.all(18),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(svgIcon: 'assets/svg/Lock.svg')),
    );
  }
}
