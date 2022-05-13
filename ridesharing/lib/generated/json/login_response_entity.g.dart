import 'package:ridesharing/generated/json/base/json_convert_content.dart';
import 'package:ridesharing/http/response/login_response_entity.dart';

LoginResponseEntity $LoginResponseEntityFromJson(Map<String, dynamic> json) {
  final LoginResponseEntity loginResponseEntity = LoginResponseEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    loginResponseEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    loginResponseEntity.message = message;
  }
  final LoginResponseData? data =
      jsonConvert.convert<LoginResponseData>(json['data']);
  if (data != null) {
    loginResponseEntity.data = data;
  }
  return loginResponseEntity;
}

Map<String, dynamic> $LoginResponseEntityToJson(LoginResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['data'] = entity.data?.toJson();
  return data;
}

LoginResponseData $LoginResponseDataFromJson(Map<String, dynamic> json) {
  final LoginResponseData loginResponseData = LoginResponseData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    loginResponseData.id = id;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    loginResponseData.username = username;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    loginResponseData.password = password;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    loginResponseData.email = email;
  }
  final String? number = jsonConvert.convert<String>(json['number']);
  if (number != null) {
    loginResponseData.number = number;
  }
  final String? regdate = jsonConvert.convert<String>(json['regdate']);
  if (regdate != null) {
    loginResponseData.regdate = regdate;
  }
  return loginResponseData;
}

Map<String, dynamic> $LoginResponseDataToJson(LoginResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['username'] = entity.username;
  data['password'] = entity.password;
  data['email'] = entity.email;
  data['number'] = entity.number;
  data['regdate'] = entity.regdate;
  return data;
}
