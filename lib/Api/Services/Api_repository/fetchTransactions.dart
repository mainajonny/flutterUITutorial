import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:nash_mini/Api/Services/base_url.dart';
import 'package:nash_mini/Api/repository/end_point.dart';
import 'package:nash_mini/Models/auth_model.dart';
import 'package:nash_mini/Models/transactions_model.dart';

class fetchTransactions {
  Future<TransactionsModel> getTransactions(clientId) async {
    var client = http.Client();
    var jsonTransactionModel;
    var url = Uri.parse(BaseURL.getSelfServiceUrl() +
        ApiEndPoints.CLIENTS +
        "/$clientId/accounts");

    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonTransactionString = response.body;
        var jsonTransactionMap = json.decode(jsonTransactionString);

        jsonTransactionModel = AuthModel.fromJson(jsonTransactionMap);
        print('### SUCCESS ' + response.body);
        Fluttertoast.showToast(
            msg: 'API call SUCCESSFUL',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.white,
            fontSize: 15.0);
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

    return jsonTransactionModel;
  }
}
