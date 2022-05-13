
class NeedLogin extends HgNetError {
  NeedLogin({int code: 401, String message: '请先登录'}) : super(code, message);
}


class NeedAuth extends HgNetError {
  NeedAuth(String message, {int code: 403, dynamic data})
      : super(code, message, data: data);
}


class HgNetError implements Exception {
  final int? code;
  final String message;
  final dynamic data;

  HgNetError(this.code, this.message, {this.data});
}
