// ignore_for_file: constant_identifier_names

import 'package:accurate_test/network/failure/failure.dart';
import 'package:accurate_test/network/response/response_code.dart';
import 'package:accurate_test/network/response/response_message.dart';

enum DataSource {
  SUCCESS,
  CONNECT_TIMEOUT,
  SEND_TIMEOUT,
  RECEIVE_TIMEOUT,
  BAD_CERTIFICATE,
  CANCEL,
  NO_CONNECTION,

  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,

  DEFAULT
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
          code: ResponseCode.CONNECT_TIMEOUT,
          message: ResponseErrorMessages.connectionTimeout,
        );
      case DataSource.SEND_TIMEOUT:
        return Failure(
          code: ResponseCode.SEND_TIMEOUT,
          message: ResponseErrorMessages.sendTimeout,
        );
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
          code: ResponseCode.RECEIVE_TIMEOUT,
          message: ResponseErrorMessages.receiveTimeout,
        );
      case DataSource.BAD_CERTIFICATE:
        return Failure(
          code: ResponseCode.BAD_CERTIFICATE,
          message: ResponseErrorMessages.badCertificate,
        );
      case DataSource.CANCEL:
        return Failure(
          code: ResponseCode.CANCEL,
          message: ResponseErrorMessages.cancel,
        );
      case DataSource.NO_CONNECTION:
        return Failure(
          code: ResponseCode.NO_CONNECTION,
          message: ResponseErrorMessages.connectionError,
        );
      case DataSource.BAD_REQUEST:
        return Failure(
          code: ResponseCode.BAD_REQUEST,
          message: ResponseErrorMessages.badRequest,
        );
      case DataSource.FORBIDDEN:
        return Failure(
          code: ResponseCode.FORBIDDEN,
          message: ResponseErrorMessages.forbidden,
        );
      case DataSource.UNAUTHORIZED:
        return Failure(
          code: ResponseCode.UNAUTHORIZED,
          message: ResponseErrorMessages.unauthorized,
        );
      case DataSource.NOT_FOUND:
        return Failure(
          code: ResponseCode.NOT_FOUND,
          message: ResponseErrorMessages.notFound,
        );
      default:
        return Failure(
          code: ResponseCode.DEFAULT,
          message: ResponseErrorMessages.defaultError,
        );
    }
  }
}
