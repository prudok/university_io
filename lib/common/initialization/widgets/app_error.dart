import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Column(
          children: [
            Icon(Icons.close, color: theme.colorScheme.error, size: 40),
            Text(
              'Something went wrong.',
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}
