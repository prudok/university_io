import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:university_io/common/initialization/initialization.dart';
import 'package:university_io/common/initialization/widgets/app.dart';
import 'package:university_io/common/initialization/widgets/app_error.dart';

@pragma('vm:entry-point')
void main() => runZonedGuarded<Future<void>>(
      () async {
        try {
          await initializeDependencies();
        } on Object catch (_, __) {
          runApp(const AppError());
        }
        runApp(const App());
      },
      (error, stackTrace) {
        if (kDebugMode) {
          print(error);
          print(stackTrace);
        }
      },
    );
