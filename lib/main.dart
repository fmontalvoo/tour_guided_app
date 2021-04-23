import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tour_guided_app/src/ui/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tour guided app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) =>
            ShowCaseWidget(builder: Builder(builder: (context) => HomePage())),
      },
    );
  }
}
