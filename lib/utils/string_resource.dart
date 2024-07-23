class StringResource {
  static const labelSearch = 'Name';
  static const hintSearch = 'Search by name...';

  // Success messages
  static const String successCompleted = 'Request completed successfully.';
  static const String successCreated = 'Resource created successfully.';

  // Error messages
  static const String errorConnectionTimeout =
      'Connection timed out. Please try again later.';
  static const String errorSendTimeout =
      'Request send timed out. Please try again later.';
  static const String errorReceiveTimeout =
      'Response receive timed out. Please try again later.';
  static const String errorBadCertificate =
      'Bad certificate. Please check your connection and try again.';
  static const String errorBadResponse =
      'Received a bad response from the server. Please try again later.';
  static const String errorCancel = 'Request was cancelled. Please try again.';
  static const String errorConnectionError =
      'Connection error. Please check your internet connection and try again.';
  static const String errorUnknown =
      'An unknown error occurred. Please try again later.';

  static const String errorBadRequest =
      'Bad request. Please check the request parameters and try again.';
  static const String errorUnauthorized =
      'Unauthorized request. Please check your credentials.';
  static const String errorForbidden =
      'Forbidden request. You do not have permission to access this resource.';
  static const String errorNotFound = 'Resource not found.';
  static const String errorInternalServerError =
      'Internal server error. Please try again later.';

  // Default error message
  static const String errorDefault =
      'An unexpected error occurred. Please try again later.';
}
