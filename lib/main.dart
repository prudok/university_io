import 'dart:async';

import 'package:education_portal/common/initialization/initialization.dart';
import 'package:education_portal/common/initialization/widgets/app.dart';
import 'package:education_portal/common/initialization/widgets/app_error.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runZonedGuarded<Future<void>>(
      () async {
        try {
          await initializeDependencies();
        } on Object catch (_, __) {
          runApp(const AppError());
          return;
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
