enum HttpMethod { GET, POST, DELETE, FILE }


abstract class BaseRequest {
  var pathParams;
  var useHttps = false;

  String authority() {
    return "192.168.50.111:8088";
  }

  HttpMethod httpMethod();

  String path();

  String getPicPath(String url) {
    Uri uri;
    var pathStr = url;

    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }

    if (useHttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
    }
    print('url:${uri.toString()}');
    return uri.toString();
  }

  String url() {
    Uri uri;
    var pathStr = path();

    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }

    if (useHttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
    }
    if (needLogin()) {


      // addHeader(LoginDao.AUTHORIZATION, Get.find<AppService>().token.value);
    }
    print('url:${uri.toString()}');
    return uri.toString();
  }

  bool needLogin();

  Map<String, String> params = Map();


  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  Map<String, dynamic> header = {};


  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    return this;
  }
}
