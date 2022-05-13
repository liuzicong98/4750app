import 'dart:convert';

import '../request/base_request.dart';


abstract class HgNetAdapter {
  Future<HgNetResponse<dynamic>> send(BaseRequest request);
}

class HgNetResponse<T> {
  HgNetResponse({
    this.data,
    this.code,
    this.msg,
  });

  /// Response body. may have been transformed, please refer to [ResponseType].
  T? data;

  /// Http status code.
  int? code;

  /// Returns the reason phrase associated with the status code.
  /// The reason phrase must be set before the body is written
  /// to. Setting the reason phrase after writing to the body.
  String? msg;

  HgNetResponse.fromJson(Map<String, dynamic> json) {
    this.data = json['data'];

    this.code = json['code'];

    this.msg = json['msg'];
  }

  /// We are more concerned about `data` field.
  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}
