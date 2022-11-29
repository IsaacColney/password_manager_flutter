import 'package:flutter/material.dart';
import 'package:password_manager/screens/initialize_screen.dart';

class MainScreens extends StatelessWidget {
  const MainScreens({Key? key}) : super(key: key);
  static const String mainScreensRoute = "MainScreensRoute";
  void importCSVFile() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0), body: const InitializeScreen());
  }
}
