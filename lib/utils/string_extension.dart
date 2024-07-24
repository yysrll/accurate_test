extension StringExtension on String {
  bool isValidEmail() {
    // Define the regex pattern for a valid email address
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegex.hasMatch(this);
  }

  bool isValidPhoneNumber() {
    final RegExp phoneRegex = RegExp(
      r'^08[0-9]+$', // Must start with 08 followed by any number of digits
    );

    return phoneRegex.hasMatch(this);
  }
}
