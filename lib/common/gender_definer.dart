class GenderDefiner {
  static String getGenderValue(int value) {
    switch (value) {
      case 1:
        return 'man';
      case 2:
        return 'woman';
      default:
        return 'none';
    }
  }
}
