import 'package:flutter/material.dart';

class UniTheme extends InheritedWidget {
  const UniTheme({
    required this.onThemeUpdated,
    required this.child,
    super.key,
  }) : super(child: child);

  @override
  final Widget child;
  final ValueChanged<ThemeData> onThemeUpdated;

  void updateTheme(ThemeData theme) {
    onThemeUpdated(theme);
  }

  static UniTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UniTheme>();
  }

  @override
  bool updateShouldNotify(UniTheme oldWidget) {
    return true;
  }
}
