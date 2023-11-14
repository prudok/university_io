import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_io/config/config.dart';

Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  configureDependencies();
}
