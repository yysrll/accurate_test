import 'package:accurate_test/network/failure/failure.dart';
import 'package:accurate_test/network/response/data_source.dart';
import 'package:accurate_test/network/response/response_code.dart';
import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handler(dynamic error) {
    if (error is DioException) {
      failure = _handleDioError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleDioError(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.BAD_CERTIFICATE.getFailure();
      case DioExceptionType.badResponse:
        return _handleBadResponse(err);
      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.NO_CONNECTION.getFailure();
      case DioExceptionType.unknown:
        return DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleBadResponse(DioException err) {
    final response = err.response;

    if (response?.statusCode == ResponseCode.BAD_REQUEST) {
      return DataSource.BAD_REQUEST.getFailure();
    }

    if (response?.statusCode == ResponseCode.UNAUTHORIZED) {
      return DataSource.UNAUTHORIZED.getFailure();
    }

    if (response?.statusCode == ResponseCode.FORBIDDEN) {
      return DataSource.FORBIDDEN.getFailure();
    }

    if (response?.statusCode == ResponseCode.NOT_FOUND) {
      return DataSource.NOT_FOUND.getFailure();
    }

    return DataSource.DEFAULT.getFailure();
  }
}
