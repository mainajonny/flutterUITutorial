// To parse this JSON data, do
//
//     final clientModel = clientModelFromJson(jsonString);

import 'dart:convert';

ClientModel clientModelFromJson(String str) =>
    ClientModel.fromJson(json.decode(str));

String clientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
  ClientModel({
    required this.id,
    required this.accountNo,
    required this.externalId,
    required this.status,
    required this.subStatus,
    required this.active,
    required this.activationDate,
    required this.fullname,
    required this.displayName,
    required this.mobileNo,
    required this.gender,
    required this.clientType,
    required this.clientClassification,
    required this.isStaff,
    required this.officeId,
    required this.officeName,
    required this.timeline,
    required this.savingsAccountId,
    required this.groups,
    required this.clientNonPersonDetails,
  });

  int id;
  String accountNo;
  String externalId;
  Status status;
  ClientClassification subStatus;
  bool active;
  List<int> activationDate;
  String fullname;
  String displayName;
  String mobileNo;
  ClientClassification gender;
  ClientClassification clientType;
  ClientClassification clientClassification;
  bool isStaff;
  int officeId;
  String officeName;
  Timeline timeline;
  int savingsAccountId;
  List<dynamic> groups;
  ClientNonPersonDetails clientNonPersonDetails;

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id: json["id"],
        accountNo: json["accountNo"],
        externalId: json["externalId"],
        status: Status.fromJson(json["status"]),
        subStatus: ClientClassification.fromJson(json["subStatus"]),
        active: json["active"],
        activationDate: List<int>.from(json["activationDate"].map((x) => x)),
        fullname: json["fullname"],
        displayName: json["displayName"],
        mobileNo: json["mobileNo"],
        gender: ClientClassification.fromJson(json["gender"]),
        clientType: ClientClassification.fromJson(json["clientType"]),
        clientClassification:
            ClientClassification.fromJson(json["clientClassification"]),
        isStaff: json["isStaff"],
        officeId: json["officeId"],
        officeName: json["officeName"],
        timeline: Timeline.fromJson(json["timeline"]),
        savingsAccountId: json["savingsAccountId"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        clientNonPersonDetails:
            ClientNonPersonDetails.fromJson(json["clientNonPersonDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "accountNo": accountNo,
        "externalId": externalId,
        "status": status.toJson(),
        "subStatus": subStatus.toJson(),
        "active": active,
        "activationDate": List<dynamic>.from(activationDate.map((x) => x)),
        "fullname": fullname,
        "displayName": displayName,
        "mobileNo": mobileNo,
        "gender": gender.toJson(),
        "clientType": clientType.toJson(),
        "clientClassification": clientClassification.toJson(),
        "isStaff": isStaff,
        "officeId": officeId,
        "officeName": officeName,
        "timeline": timeline.toJson(),
        "savingsAccountId": savingsAccountId,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "clientNonPersonDetails": clientNonPersonDetails.toJson(),
      };
}

class ClientClassification {
  ClientClassification({
    required this.active,
    required this.mandatory,
  });

  bool active;
  bool mandatory;

  factory ClientClassification.fromJson(Map<String, dynamic> json) =>
      ClientClassification(
        active: json["active"],
        mandatory: json["mandatory"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "mandatory": mandatory,
      };
}

class ClientNonPersonDetails {
  ClientNonPersonDetails({
    required this.constitution,
    required this.mainBusinessLine,
  });

  ClientClassification constitution;
  ClientClassification mainBusinessLine;

  factory ClientNonPersonDetails.fromJson(Map<String, dynamic> json) =>
      ClientNonPersonDetails(
        constitution: ClientClassification.fromJson(json["constitution"]),
        mainBusinessLine:
            ClientClassification.fromJson(json["mainBusinessLine"]),
      );

  Map<String, dynamic> toJson() => {
        "constitution": constitution.toJson(),
        "mainBusinessLine": mainBusinessLine.toJson(),
      };
}

class Status {
  Status({
    required this.id,
    required this.code,
    required this.value,
  });

  int id;
  String code;
  String value;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        code: json["code"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "value": value,
      };
}

class Timeline {
  Timeline({
    required this.submittedOnDate,
    required this.submittedByUsername,
    required this.submittedByFirstname,
    required this.submittedByLastname,
    required this.activatedOnDate,
    required this.activatedByUsername,
    required this.activatedByFirstname,
    required this.activatedByLastname,
  });

  List<int> submittedOnDate;
  String submittedByUsername;
  String submittedByFirstname;
  String submittedByLastname;
  List<int> activatedOnDate;
  String activatedByUsername;
  String activatedByFirstname;
  String activatedByLastname;

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        submittedOnDate: List<int>.from(json["submittedOnDate"].map((x) => x)),
        submittedByUsername: json["submittedByUsername"],
        submittedByFirstname: json["submittedByFirstname"],
        submittedByLastname: json["submittedByLastname"],
        activatedOnDate: List<int>.from(json["activatedOnDate"].map((x) => x)),
        activatedByUsername: json["activatedByUsername"],
        activatedByFirstname: json["activatedByFirstname"],
        activatedByLastname: json["activatedByLastname"],
      );

  Map<String, dynamic> toJson() => {
        "submittedOnDate": List<dynamic>.from(submittedOnDate.map((x) => x)),
        "submittedByUsername": submittedByUsername,
        "submittedByFirstname": submittedByFirstname,
        "submittedByLastname": submittedByLastname,
        "activatedOnDate": List<dynamic>.from(activatedOnDate.map((x) => x)),
        "activatedByUsername": activatedByUsername,
        "activatedByFirstname": activatedByFirstname,
        "activatedByLastname": activatedByLastname,
      };
}
