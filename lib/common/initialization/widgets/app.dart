import 'package:education_portal/features/presentation/home/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      theme: ThemeData.dark(useMaterial3: true),
    );
    // return MaterialApp.router(
    //   routerConfig: getIt<AppRouter>().config(),
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData.dark(useMaterial3: true),
    // );
  }
}
