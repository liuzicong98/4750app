import 'package:ridesharing/generated/json/base/json_convert_content.dart';
import 'package:ridesharing/http/response/trip_entity.dart';

TripEntity $TripEntityFromJson(Map<String, dynamic> json) {
  final TripEntity tripEntity = TripEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    tripEntity.code = code;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    tripEntity.message = message;
  }
  final List<TripData>? data =
      jsonConvert.convertListNotNull<TripData>(json['data']);
  if (data != null) {
    tripEntity.data = data;
  }
  return tripEntity;
}

Map<String, dynamic> $TripEntityToJson(TripEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

TripData $TripDataFromJson(Map<String, dynamic> json) {
  final TripData tripData = TripData();
  final TripDataTrip? trip = jsonConvert.convert<TripDataTrip>(json['trip']);
  if (trip != null) {
    tripData.trip = trip;
  }
  final TripDataUser? user = jsonConvert.convert<TripDataUser>(json['user']);
  if (user != null) {
    tripData.user = user;
  }
  return tripData;
}

Map<String, dynamic> $TripDataToJson(TripData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['trip'] = entity.trip?.toJson();
  data['user'] = entity.user?.toJson();
  return data;
}

TripDataTrip $TripDataTripFromJson(Map<String, dynamic> json) {
  final TripDataTrip tripDataTrip = TripDataTrip();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    tripDataTrip.id = id;
  }
  final String? userId = jsonConvert.convert<String>(json['userId']);
  if (userId != null) {
    tripDataTrip.userId = userId;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    tripDataTrip.name = name;
  }
  final String? start = jsonConvert.convert<String>(json['start']);
  if (start != null) {
    tripDataTrip.start = start;
  }
  final String? end = jsonConvert.convert<String>(json['end']);
  if (end != null) {
    tripDataTrip.end = end;
  }
  final String? mode = jsonConvert.convert<String>(json['mode']);
  if (mode != null) {
    tripDataTrip.mode = mode;
  }
  final int? seat = jsonConvert.convert<int>(json['seat']);
  if (seat != null) {
    tripDataTrip.seat = seat;
  }
  final String? number = jsonConvert.convert<String>(json['number']);
  if (number != null) {
    tripDataTrip.number = number;
  }
  final String? dateline = jsonConvert.convert<String>(json['dateline']);
  if (dateline != null) {
    tripDataTrip.dateline = dateline;
  }
  return tripDataTrip;
}

Map<String, dynamic> $TripDataTripToJson(TripDataTrip entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userId'] = entity.userId;
  data['name'] = entity.name;
  data['start'] = entity.start;
  data['end'] = entity.end;
  data['mode'] = entity.mode;
  data['seat'] = entity.seat;
  data['number'] = entity.number;
  data['dateline'] = entity.dateline;
  return data;
}

TripDataUser $TripDataUserFromJson(Map<String, dynamic> json) {
  final TripDataUser tripDataUser = TripDataUser();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    tripDataUser.id = id;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    tripDataUser.username = username;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    tripDataUser.password = password;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    tripDataUser.email = email;
  }
  final String? number = jsonConvert.convert<String>(json['number']);
  if (number != null) {
    tripDataUser.number = number;
  }
  final String? regdate = jsonConvert.convert<String>(json['regdate']);
  if (regdate != null) {
    tripDataUser.regdate = regdate;
  }
  return tripDataUser;
}

Map<String, dynamic> $TripDataUserToJson(TripDataUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['username'] = entity.username;
  data['password'] = entity.password;
  data['email'] = entity.email;
  data['number'] = entity.number;
  data['regdate'] = entity.regdate;
  return data;
}
