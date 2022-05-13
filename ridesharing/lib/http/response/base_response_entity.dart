import 'dart:convert';

import 'package:ridesharing/generated/json/base/json_field.dart';
import 'package:ridesharing/generated/json/base_response_entity.g.dart';

@JsonSerializable()
class BaseResponseEntity {
  int? code;
  String? message;
  dynamic data;

  BaseResponseEntity();

  factory BaseResponseEntity.fromJson(Map<String, dynamic> json) =>
      $BaseResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $BaseResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
