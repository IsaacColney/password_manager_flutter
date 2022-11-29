import 'package:flutter/material.dart';
import 'package:password_manager/screens/main_screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const MainScreens(),
      routes: {MainScreens.mainScreensRoute: (context) => const MainScreens()},
    );
  }
}
