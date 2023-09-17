import 'package:flutter/material.dart';

class SpacingFoundation {
  SpacingFoundation._();

  static Widget get verticalSpaceSmall => const SizedBox(height: 15);
  static Widget get verticalSpaceHigh => const SizedBox(height: 50);
  static Widget get verticalSpaceMedium => const SizedBox(height: 30);
  static Widget get horizontalSpaceSmall => const SizedBox(width: 15);
}
