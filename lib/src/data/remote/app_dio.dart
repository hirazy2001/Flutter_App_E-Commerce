import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_firebase_performance/dio_firebase_performance.dart';

// final dioProvider = Provider((_) => AppDio.getInstance());

class AppDio with DioMixin implements Dio{

  AppDio._([BaseOptions? options]) {
    options = BaseOptions(
      // baseUrl: Constants.endpoint,
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;
    interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      handler.next(options);
    }));

    interceptors.add(DioFirebasePerformanceInterceptor());

    // if (kDebugMode) {
    //   // Local Log
    //   interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    // }

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance() => AppDio._();
}