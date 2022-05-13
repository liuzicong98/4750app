import 'dart:convert';

import 'package:ridesharing/generated/json/base/json_field.dart';
import 'package:ridesharing/generated/json/trip_entity.g.dart';

@JsonSerializable()
class TripEntity {
  int? code;
  String? message;
  List<TripData>? data;

  TripEntity();

  factory TripEntity.fromJson(Map<String, dynamic> json) =>
      $TripEntityFromJson(json);

  Map<String, dynamic> toJson() => $TripEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TripData {
  TripDataTrip? trip;
  TripDataUser? user;

  TripData();

  factory TripData.fromJson(Map<String, dynamic> json) =>
      $TripDataFromJson(json);

  Map<String, dynamic> toJson() => $TripDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TripDataTrip {
  int? id;
  String? userId;
  String? name;
  String? start;
  String? end;
  String? mode;
  int? seat;
  String? number;
  String? dateline;

  TripDataTrip();

  factory TripDataTrip.fromJson(Map<String, dynamic> json) =>
      $TripDataTripFromJson(json);

  Map<String, dynamic> toJson() => $TripDataTripToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TripDataUser {
  int? id;
  String? username;
  String? password;
  String? email;
  String? number;
  String? regdate;

  TripDataUser();

  factory TripDataUser.fromJson(Map<String, dynamic> json) =>
      $TripDataUserFromJson(json);

  Map<String, dynamic> toJson() => $TripDataUserToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
