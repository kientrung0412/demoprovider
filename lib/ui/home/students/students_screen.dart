import 'package:demo_provider/cons/custom_edge.dart';
import 'package:demo_provider/ui/home/students/students_list.dart';
import 'package:demo_provider/ui/home/students/students_search_bar.dart';
import 'package:flutter/cupertino.dart';

class StudentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(margin: CustomEdge.edgeBottom16, child: StudentsSearchBar()),
        Expanded(
          child: HomeListStudent(),
        ),
      ],
    );
  }
}
