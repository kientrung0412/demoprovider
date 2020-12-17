import 'package:demo_provider/ui/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      onGenerateRoute: generateRoute,
    );
  }

  Route generateRoute(RouteSettings settings) {
    return CupertinoPageRoute(
      builder: (context) => HomeScreen(),
      settings: settings,
    );
  }
}
