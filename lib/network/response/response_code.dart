// ignore_for_file: constant_identifier_names

class ResponseCode {
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;

  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int SEND_TIMEOUT = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int BAD_CERTIFICATE = -5;
  static const int CANCEL = -6;
  static const int NO_CONNECTION = -7;
}
