import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ridesharing/http/request/add_trip_request.dart';
import 'package:ridesharing/http/request/del_trip_request.dart';
import 'package:ridesharing/http/request/getrip_my_request.dart';
import 'package:ridesharing/http/request/join_request.dart';
import 'package:ridesharing/http/response/base_response_entity.dart';
import 'package:ridesharing/http/response/trip_entity.dart';
import 'package:ridesharing/service/app_service.dart';

import '../request/base_request.dart';
import '../request/getrip_request.dart';

class TripDao {
  static getTrip(int type) {
    return _getTrip(type);
  }

  static _getTrip(int type) async {
    // BaseRequest request = GetripRequest();
    // request.add('type', type);
    // var result = await Dio().get(request.url());
    //
    // TripEntity response = TripEntity.fromJson(result.data);
    // return response;
  }

  static getMyTrip() async {
    // BaseRequest request = GetripMyRequest();
    // request.add('userid', '${Get.find<AppService>().user.value.id}');
    // var result = await Dio().post(request.url());
    // TripEntity response = TripEntity.fromJson(result.data);
    // return response;
  }

  static addTrip(String name, String start, String end, String date,
      String model, String seat, String number, int type) async {
    // BaseRequest request = AddTripRequest();
    // request
    //     .add('name', name)
    //     .add('start', start)
    //     .add('end', end)
    //     .add('date', date)
    //     .add('model', model)
    //     .add('seat', seat)
    //     .add('number', number)
    //     .add('userid', Get.find<AppService>().user.value.id.toString())
    //     .add('type', type);
    // var result = await Dio().post(request.url());
    // BaseResponseEntity entity = BaseResponseEntity.fromJson(result.data);
    // return entity;
  }

  static join(int tripId, int userid) async {
    BaseRequest request = JoinRequest();
    request.add('tripid', tripId).add('userid', userid);
    var result = await Dio().post(request.url());
    BaseResponseEntity entity = BaseResponseEntity.fromJson(result.data);
    return entity;
  }

  static del(String tripid) async {
    BaseRequest request = DelTripRequest();
    request.add('tripid', tripid);
    var result = await Dio().post(request.url());
    BaseResponseEntity entity = BaseResponseEntity.fromJson(result.data);
    return entity;
  }
}
