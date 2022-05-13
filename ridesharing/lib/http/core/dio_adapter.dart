import 'package:dio/dio.dart';

import '../request/base_request.dart';
import 'hg_error.dart';
import 'hg_net_adapter.dart';

///Dio
class DioAdapter extends HgNetAdapter {
  @override
  Future<HgNetResponse<dynamic>> send(BaseRequest request) async {
    var response, options = Options(headers: request.header);
    var error;
    try {
      if (request.httpMethod() == HttpMethod.GET) {
        response = await Dio().get(request.url(), options: options);
      } else if (request.httpMethod() == HttpMethod.POST) {
        response = await Dio()
            .post(request.url(), data: request.params, options: options);
      } else if (request.httpMethod() == HttpMethod.DELETE) {
        response = await Dio()
            .delete(request.url(), data: request.params, options: options);
      }
    } on DioError catch (e) {
      error = e;
      response = e.response;
    }
    if (error != null) {

      throw HgNetError(response?.statusCode ?? -1, error.toString(),
          data: buildRes(response, request));
    }
    return buildRes(response, request);
  }


  HgNetResponse buildRes(Response response, BaseRequest request) {
    return HgNetResponse(
      data: response.data,
      code: response.statusCode,
      msg: response.statusMessage,
    );
  }
}
