import 'package:dio/dio.dart';
import 'package:flutter_app_e_commerce/src/common/constants.dart';
export 'package:dio/dio.dart';

class ApiStrategy {
  static late ApiStrategy _instance;

  Dio? _client;

  static final String baseUrl = Constants.BASE_URL;
  static const int connectTimeOut = 10 * 1000; //连接超时时间为10秒
  static const int receiveTimeOut = 15 * 1000; //响应超时时间为15秒

  static ApiStrategy getInstance() {
    _instance ??= ApiStrategy._internal();
    return _instance;
  }

  ApiStrategy._internal() {
    if (_client == null) {
      BaseOptions options = new BaseOptions();
      options.connectTimeout = connectTimeOut;
      options.receiveTimeout = receiveTimeOut;
      options.baseUrl = baseUrl;
      _client = new Dio(options);
      _client!.interceptors.add(LogInterceptor(
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
      )); //开启请求日志
    }
  }

  Dio? get client => _client;
  static const String GET = "get";
  static const String POST = "post";

  static String getBaseUrl() {
    return baseUrl;
  }

  void _request(
    String url,
    Function callBack, {
    String? method,
    Map<String, String>? params,
    FormData? formData,
    Function? errorCallBack,
    ProgressCallback? progressCallBack,
    CancelToken? token,
  }) async {
    if (params != null && params.isNotEmpty) {
      print("<net> params :" + params.toString());
    }

    String errorMsg = "";
    int statusCode;
    try {
      Response response;
      if (method == GET) {
        if (params != null && params.isNotEmpty) {
          response = await _client!.get(
            url,
            queryParameters: params,
            cancelToken: token,
          );
        } else {
          response = await _client!.get(
            url,
            cancelToken: token,
          );
        }
      } else {
        if (params != null && params.isNotEmpty) {
          response = await _client!.post(
            url,
            data: formData ?? FormData.fromMap(params),
            onSendProgress: progressCallBack,
            cancelToken: token,
          );
        } else {
          response = await _client!.post(
            url,
            cancelToken: token,
          );
        }
      }

      statusCode = response.statusCode!;

      if (statusCode < 0) {
        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
        _handError(errorCallBack!, errorMsg);
        return;
      }

      if (callBack != null) {
        callBack(response.data);
      }
    } catch (e) {
      _handError(errorCallBack!, e.toString());
    }
  }

  static void _handError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
    print("<net> errorMsg :" + errorMsg);
  }
}
