import 'package:dio/dio.dart';
import 'package:ridesharing/http/request/get_message.dart';

import '../request/base_request.dart';
import '../response/trip_entity.dart';

class MessageDao {
  static getAllMessage(String userid) async {
    BaseRequest request = GetMessage();
    request.add('userid', userid);
    var result = await Dio().post(request.url());
    TripEntity response = TripEntity.fromJson(result.data);
    return response;
  }
}
