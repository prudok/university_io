abstract class Validator {
  static String? validName(String? name) {
    final regex = RegExp(r'^[a-zA-Z]+$');
    if (regex.hasMatch(name ?? '') && name != null) {
      return null;
    } else {
      return 'Please Fill Form Correctly';
    }
  }

  static String? validSurname(String? name) {
    final regex = RegExp(r'^[a-zA-Z]+$');
    if (regex.hasMatch(name ?? '') && name != null) {
      return null;
    } else {
      return 'Please Fill Form Correctly';
    }
  }
}
