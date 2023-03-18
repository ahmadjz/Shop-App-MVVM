import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shop_app_mvvm/data/network/failure.dart';
import 'package:shop_app_mvvm/presentation/resources/strings_manager.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSource.connectTimeOut.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioErrorType.cancel:
      return DataSource.cancel.getFailure();
    case DioErrorType.other:
      return DataSource.defaultError.getFailure();
    case DioErrorType.response:
      // that means the error came from the api with an error code
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(
            code: error.response?.statusCode ?? 0,
            message: error.response?.statusMessage ?? "");
      } else {
        return DataSource.defaultError.getFailure();
      }
  }
}

enum DataSource {
  defaultError,
  success,
  noContent,
  badRequest,
  forbidden,
  unAuthorized,
  notFound,
  internetServerError,
  connectTimeOut,
  cancel,
  receiveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(
          code: ResponseCode.success,
          message: ResponseMessage.success,
        );
      case DataSource.noContent:
        return Failure(
          code: ResponseCode.noContent,
          message: ResponseMessage.noContent,
        );

      case DataSource.badRequest:
        return Failure(
          code: ResponseCode.badRequest,
          message: ResponseMessage.badRequest,
        );

      case DataSource.forbidden:
        return Failure(
          code: ResponseCode.forbidden,
          message: ResponseMessage.forbidden,
        );

      case DataSource.unAuthorized:
        return Failure(
          code: ResponseCode.unAuthorized,
          message: ResponseMessage.unAuthorized,
        );

      case DataSource.notFound:
        return Failure(
          code: ResponseCode.notFound,
          message: ResponseMessage.notFound,
        );

      case DataSource.internetServerError:
        return Failure(
          code: ResponseCode.internetServerError,
          message: ResponseMessage.internetServerError,
        );

      case DataSource.connectTimeOut:
        return Failure(
          code: ResponseCode.connectTimeOut,
          message: ResponseMessage.connectTimeOut,
        );

      case DataSource.cancel:
        return Failure(
          code: ResponseCode.cancel,
          message: ResponseMessage.cancel,
        );

      case DataSource.receiveTimeOut:
        return Failure(
          code: ResponseCode.receiveTimeOut,
          message: ResponseMessage.receiveTimeOut,
        );

      case DataSource.sendTimeOut:
        return Failure(
          code: ResponseCode.sendTimeOut,
          message: ResponseMessage.sendTimeOut,
        );

      case DataSource.cacheError:
        return Failure(
          code: ResponseCode.cacheError,
          message: ResponseMessage.cacheError,
        );

      case DataSource.noInternetConnection:
        return Failure(
          code: ResponseCode.noInternetConnection,
          message: ResponseMessage.noInternetConnection,
        );
      case DataSource.defaultError:
        return Failure(
          code: ResponseCode.defaultError,
          message: ResponseMessage.defaultError,
        );
    }
  }
}

class ResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int forbidden = 403;
  static const int unAuthorized = 401;
  static const int notFound = 404;
  static const int internetServerError = 500;

  // local errors
  static const int connectTimeOut = -1;
  static const int cancel = -2;
  static const int receiveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -6;
}

class ResponseMessage {
  static String success = AppStrings.success.tr();
  static String noContent = AppStrings.success.tr();
  static String badRequest = AppStrings.badRequestError.tr();
  static String forbidden = AppStrings.forbiddenError.tr();
  static String unAuthorized = AppStrings.unauthorizedError.tr();
  static String notFound = AppStrings.notFoundError.tr();
  static String internetServerError = AppStrings.internalServerError.tr();

  // local errors
  static String connectTimeOut = AppStrings.timeoutError.tr();
  static String cancel = AppStrings.defaultError.tr();
  static String receiveTimeOut = AppStrings.timeoutError.tr();
  static String sendTimeOut = AppStrings.timeoutError.tr();
  static String cacheError = AppStrings.cacheError.tr();
  static String noInternetConnection = AppStrings.noInternetError.tr();
  static String defaultError = AppStrings.defaultError.tr();
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
