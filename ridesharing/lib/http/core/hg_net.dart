import '../request/base_request.dart';
import 'dio_adapter.dart';
import 'hg_error.dart';
import 'hg_interceptor.dart';
import 'hg_net_adapter.dart';


class HgNet {
  HgNet._();

  HgErrorInterceptor? _hgErrorInterceptor;
  static HgNet? _instance;

  static HgNet? getInstance() {
    if (_instance == null) {
      _instance = HgNet._();
    }
    return _instance;
  }

  Future fire(BaseRequest request) async {
    HgNetResponse? response;
    var error;
    try {
      response = await send(request);
    } on HgNetError catch (e) {
      error = e;
      response = e.data;
      printLog(e.message);
    } catch (e) {
      //其它异常
      error = e;
      printLog(e);
    }
    if (response == null) {
      printLog(error);
    }
    var result = response?.data;
    printLog(result);
    var status = response?.code;
    var hgError;
    switch (status) {
      case 200:
        return result;
        break;
      case 401:
        hgError = NeedLogin();
        break;
      case 403:
        hgError = NeedAuth(result.toString(), data: result);
        break;
      default:
        hgError = HgNetError(status, result.toString(), data: result);
        break;
    }
    //交给拦截器处理错误
    if (_hgErrorInterceptor != null) {
      _hgErrorInterceptor!(hgError);
    }
    throw hgError;
  }

  Future<HgNetResponse<dynamic>> send(BaseRequest request) async {

    HgNetAdapter adapter = DioAdapter();
    return adapter.send(request);
  }

  void setErrorInterceptor(HgErrorInterceptor interceptor) {
    this._hgErrorInterceptor = interceptor;
  }

  void printLog(log) {
    print('hg_net:' + log.toString());
  }
}
