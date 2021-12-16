import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:nash_mini/Api/Services/api_manager.dart';
import 'package:nash_mini/Api/Services/base_url.dart';
import 'package:nash_mini/Api/repository/end_point.dart';
import 'package:nash_mini/Models/auth_model.dart';
import 'package:nash_mini/Screens/home/home_screen.dart';
import 'package:nash_mini/constants.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class authUser {
  Future<AuthModel> authenticateUser(
      String password, String username, BuildContext context) async {
    ProgressDialog pd = ProgressDialog(context: context);
    var client = http.Client();
    var jsonAuthModel;
    var url =
        Uri.parse(BaseURL.getSelfServiceUrl() + ApiEndPoints.AUTHENTICATION);

    try {
      pd.show(
          max: 100,
          msg: 'Loading...',
          progressType: ProgressType.normal,
          backgroundColor: Colors.black45,
          progressValueColor: kPrimaryColor,
          progressBgColor: Colors.grey,
          msgColor: Colors.white);

      var response = await client.post(url,
          body: json.encode({"password": password, "username": username}),
          headers: API_Manager().authApiHeaders);

      print('## ' + jsonEncode({"password": password, "username": username}));

      if (response.statusCode == 200) {
        pd.close();

        var jsonAuthString = response.body;
        var jsonAuthMap = json.decode(jsonAuthString);

        jsonAuthModel = AuthModel.fromJson(jsonAuthMap);

        print('### SUCCESS ' + response.body);

        Fluttertoast.showToast(
            msg: 'Auth SUCCESSFUL',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.white,
            fontSize: 15.0);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(
                  clientId: AuthModel.fromJson(jsonAuthMap).clients.first),
            ));

        print('### CLIENT_ID ${AuthModel.fromJson(jsonAuthMap).clients.first}');
      } else {
        pd.close();

        print('### FAILED ' + response.body);

        Fluttertoast.showToast(
            msg: 'Auth FAILED',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 15.0);
      }
    } on Exception catch (e) {
      print(e.toString());
    }

    return jsonAuthModel;
  }
}
