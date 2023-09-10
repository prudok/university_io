import 'package:education_portal/common/themes/uni_theme.dart';
import 'package:flutter/material.dart';

class AppError extends StatefulWidget {
  const AppError({super.key});

  @override
  State<AppError> createState() => _AppErrorState();
}

class _AppErrorState extends State<AppError> {
  ThemeData _theme = ThemeData.light(useMaterial3: true);

  @override
  Widget build(BuildContext context) {
    return UniTheme(
      onThemeUpdated: (theme) => setState(() => _theme = theme),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Center(
          child: Column(
            children: [
              Icon(Icons.close, color: _theme.colorScheme.error, size: 40),
              Text(
                'Something went wrong.',
                style: _theme.textTheme.titleMedium,
              ),
            ],
          ),
        ),
        theme: ThemeData.light(useMaterial3: true),
      ),
    );
  }
}
