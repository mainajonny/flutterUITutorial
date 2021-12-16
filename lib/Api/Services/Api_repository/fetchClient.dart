import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:nash_mini/Api/Services/api_manager.dart';
import 'package:nash_mini/Api/Services/base_url.dart';
import 'package:nash_mini/Api/repository/end_point.dart';
import 'package:nash_mini/Models/client_model.dart';

class fetchClient {
  Future<ClientModel> getClient(int clientId) async {
    var client = http.Client();
    var jsonClientModel;
    var url = Uri.parse(
        BaseURL.getSelfServiceUrl() + ApiEndPoints.CLIENTS + "/$clientId");

    try {
      var response = await client.get(url, headers: API_Manager().apiHeaders);

      if (response.statusCode == 200) {
        var jsonClientString = response.body;
        var jsonClientMap = json.decode(jsonClientString);

        jsonClientModel = ClientModel.fromJson(jsonClientMap);
        print('### SUCCESS ' + response.body);
        Fluttertoast.showToast(
            msg: 'API call SUCCESSFUL',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.white,
            fontSize: 15.0);

        var userName = ClientModel.fromJson(jsonClientMap).displayName;
        print('### USERNAME ' + userName);
      } else {
        //TODO write a failure function
        print('### FAILED ' + response.body);
        Fluttertoast.showToast(
            msg: 'API call FAILED',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 15.0);
      }
    } on Exception catch (e) {
      // TODO handle exception
      print(e.toString());
    }

    return jsonClientModel;
  }
}
