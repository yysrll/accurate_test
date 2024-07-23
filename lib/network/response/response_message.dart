import 'package:accurate_test/utils/string_resource.dart';

class ResponseSuccessMessages {
  static const String success = StringResource.successCompleted;
  static const String created = StringResource.successCreated;
}

class ResponseErrorMessages {
  static const String connectionTimeout = StringResource.errorConnectionTimeout;
  static const String sendTimeout = StringResource.errorSendTimeout;
  static const String receiveTimeout = StringResource.errorReceiveTimeout;
  static const String badCertificate = StringResource.errorBadCertificate;
  static const String badResponse = StringResource.errorBadResponse;
  static const String cancel = StringResource.errorCancel;
  static const String connectionError = StringResource.errorConnectionError;
  static const String unknown = StringResource.errorUnknown;

  static const String badRequest = StringResource.errorBadRequest;
  static const String unauthorized = StringResource.errorUnauthorized;
  static const String forbidden = StringResource.errorForbidden;
  static const String notFound = StringResource.errorNotFound;
  static const String internalServerError =
      StringResource.errorInternalServerError;
  static const String defaultError = StringResource.errorDefault;
}
