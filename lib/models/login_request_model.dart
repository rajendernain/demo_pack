// To parse this JSON data, do
//
//     final loginRequestModel = loginRequestModelFromJson(jsonString);

import 'dart:convert';

LoginRequestModel loginRequestModelFromJson(String str) => LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) => json.encode(data.toJson());

class LoginRequestModel {
  String? name;
  String? password;

  LoginRequestModel({
    this.name,
    this.password,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
    name: json["name"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "password": password,
  };
}
