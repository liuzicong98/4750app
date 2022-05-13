import 'package:ridesharing/http/request/base_request.dart';

class JoinRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.POST;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "/message/join";
  }
}
