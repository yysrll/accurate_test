class StringResource {
  static const hintSearch = 'Search by name...';
  static const hintLocationSearch = 'Search by location...';
  static const location = 'Location:';
  static const all = 'All';
  static const reset = 'Reset';
  static const labelName = 'Name';
  static const labelAddress = 'Address';
  static const labelPhone = 'Phone Number';
  static const labelEmail = 'Email';
  static const labelCity = 'City';

  // validator
  static const cantBeEmpty = 'This field cant be empty';
  static const invalidEmail = 'Please input a valid email';
  static const invalidPhone =
      'Please input a valid phone number, start with 08';

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
