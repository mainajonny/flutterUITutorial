// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    required this.username,
    required this.userId,
    required this.base64EncodedAuthenticationKey,
    required this.authenticated,
    required this.officeId,
    required this.officeName,
    required this.roles,
    required this.permissions,
    required this.clients,
    required this.shouldRenewPassword,
    required this.isTwoFactorAuthenticationRequired,
  });

  String username;
  int userId;
  String base64EncodedAuthenticationKey;
  bool authenticated;
  int officeId;
  String officeName;
  List<Role> roles;
  List<String> permissions;
  List<int> clients;
  bool shouldRenewPassword;
  bool isTwoFactorAuthenticationRequired;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        username: json["username"],
        userId: json["userId"],
        base64EncodedAuthenticationKey: json["base64EncodedAuthenticationKey"],
        authenticated: json["authenticated"],
        officeId: json["officeId"],
        officeName: json["officeName"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        permissions: List<String>.from(json["permissions"].map((x) => x)),
        clients: List<int>.from(json["clients"].map((x) => x)),
        shouldRenewPassword: json["shouldRenewPassword"],
        isTwoFactorAuthenticationRequired:
            json["isTwoFactorAuthenticationRequired"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "userId": userId,
        "base64EncodedAuthenticationKey": base64EncodedAuthenticationKey,
        "authenticated": authenticated,
        "officeId": officeId,
        "officeName": officeName,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "permissions": List<dynamic>.from(permissions.map((x) => x)),
        "clients": List<dynamic>.from(clients.map((x) => x)),
        "shouldRenewPassword": shouldRenewPassword,
        "isTwoFactorAuthenticationRequired": isTwoFactorAuthenticationRequired,
      };
}

class Role {
  Role({
    required this.id,
    required this.name,
    required this.description,
    required this.disabled,
  });

  int id;
  String name;
  String description;
  bool disabled;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        disabled: json["disabled"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "disabled": disabled,
      };
}
