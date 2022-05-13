import 'dart:convert';

import 'package:ridesharing/generated/json/base/json_field.dart';
import 'package:ridesharing/generated/json/login_response_entity.g.dart';

@JsonSerializable()
class LoginResponseEntity {
  int? code;
  String? message;
  LoginResponseData? data;

  LoginResponseEntity();

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      $LoginResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $LoginResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginResponseData {
  int? id;
  String? username;
  String? password;
  String? email;
  String? number;
  String? regdate;

  LoginResponseData();

  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      $LoginResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $LoginResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
