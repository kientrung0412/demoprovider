import 'package:demo_provider/cons/custom_edge.dart';
import 'package:demo_provider/ui/home/students/students_provider.dart';
import 'package:demo_provider/ui/home/students/students_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const SCREEN_NAME = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => StudentsProvider.getListUsers(context: context),
      builder: (context, child) => Consumer<StudentsProvider>(
          builder: (context, provider, child) => SafeArea(
                child: Container(
                  padding: CustomEdge.edgeHorizontal16,
                  child: StudentsScreen(),
                ),
              )),
    ));
  }
}
