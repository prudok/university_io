import 'package:education_portal/config/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  configureDependencies();
}
