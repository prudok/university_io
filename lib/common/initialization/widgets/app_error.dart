import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Column(
          children: [
            Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.error,
              size: 40,
            ),
            Text(
              'Something went wrong.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}
