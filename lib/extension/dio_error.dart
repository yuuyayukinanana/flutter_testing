import 'dart:io';

import 'package:dio/dio.dart';

extension DioErrorExt on DioError {
  String get errorMessage {


    late String message;
    switch (type) {
      case DioErrorType.other:
        if (error is SocketException) {
          message = "ネットワークエラーが発生しました。";
        } else {
          message = "想定外のエラーが発生しました。";
        }
        break;
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
         message = "タイムアウトエラーが発生しました。";
        break;
      case DioErrorType.sendTimeout:
        message = "ネットワークエラーが発生しました。";
        break;
      case DioErrorType.response:
        switch (response?.statusCode) {
          case HttpStatus.badRequest: // 400
          case HttpStatus.forbidden: //403
            message = "バットリクエストが発生しました。";
            break;
          case HttpStatus.unauthorized: // 401
            message = "認証エラーが発生しました。";
            break;
          case HttpStatus.internalServerError: // 500
          case HttpStatus.badGateway: // 502
          case HttpStatus.serviceUnavailable: // 503
          case HttpStatus.gatewayTimeout: // 504
            message = "サーバエラーは発生しました。";
            break;
          default:
            message = "想定外のエラーが発生しました。";
            break;
        }
        break;
      case DioErrorType.cancel:
        message = "キャンセルしました。";
        break;
      default:
        message = "想定外のエラーが発生しました。";
    }
    return message;
  }
}
