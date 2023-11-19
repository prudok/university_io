abstract class Validator {
  static String? validSurname(String? name) {
    final regex = RegExp(r'^[a-zA-Z]+$');
    if (regex.hasMatch(name ?? '') && name != null) {
      return null;
    } else {
      return 'Please Fill Form Correctly';
    }
  }

  static String? validEmail(String? value) {
    final regex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (regex.hasMatch(value ?? '') && value != null) {
      return null;
    } else {
      return 'Please Fill Form Correctly';
    }
  }

  static String? validName(String? value) {
    final regex = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    if (regex.hasMatch(value ?? '') && value != null) {
      return null;
    } else {
      return 'Please Fill Form Correctly';
    }
  }

  static String? validPassword(String? value) {
    final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    if (regex.hasMatch(value ?? '') && value != null) {
      return null;
    } else {
      return 'Please Fill Form Correctly';
    }
  }

  static String? validPhone(String? value) {
    final regex = RegExp(r'^\+?0[0-9]{10}$');
    if (regex.hasMatch(value ?? '') && value != null) {
      return null;
    } else {
      return 'Please Fill Form Correctly';
    }
  }
}
