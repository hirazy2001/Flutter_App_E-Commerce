import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_app_e_commerce/src/config/api_strategy.dart';

enum ErrorType {
  network,
  badRequest,
  unauthorized,
  cancel,
  timeout,
  server,
  unknown
}

class AppError {
  late String message;
  late ErrorType err;

  AppError(Exception? error) {
    if (error is DioError) {
      message = error.message;

      switch (error.type) {
        case DioErrorType.sendTimeout:
          err = ErrorType.network;
          break;
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
          err = ErrorType.timeout;
          break;
        case DioErrorType.response:
          switch (error.response!.statusCode) {
            case HttpStatus.badRequest:
              err = ErrorType.badRequest;
              break;
            case HttpStatus.unauthorized:
              err = ErrorType.unauthorized;
              break;

            case HttpStatus.internalServerError:
            case HttpStatus.badGateway:
            case HttpStatus.serviceUnavailable:
            case HttpStatus.gatewayTimeout:
              err = ErrorType.server;
              break;
            default:
              err = ErrorType.unknown;
              break;
          }
          break;
        case DioErrorType.cancel:
          err = ErrorType.cancel;
          break;
        case DioErrorType.other:
          if (error.error is SocketException) {
            err = ErrorType.network;
          } else {
            err = ErrorType.unknown;
          }
          break;
        default:
          err = ErrorType.unknown;
          break;
      }
    }
    else{
      debugPrint("'AppError(UnKnown): $error'");
      err = ErrorType.unknown;
      message = 'AppError: $error';
    }
  }
}
