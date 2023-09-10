import 'package:education_portal/common/themes/uni_theme.dart';
import 'package:education_portal/config/config.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeData _theme = ThemeData.light(useMaterial3: true);

  @override
  Widget build(BuildContext context) {
    return UniTheme(
      onThemeUpdated: (theme) => setState(() => _theme = theme),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: getIt<AppRouter>().config(),
        theme: _theme,
      ),
    );
  }
}
