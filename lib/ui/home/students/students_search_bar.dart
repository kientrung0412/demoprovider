import 'package:demo_provider/ui/home/students/students_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentsSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudentsProvider>(context);
    return TextField(
        onChanged: provider.search,
        controller: provider.textController,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.search),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            hintText: "Mã học sinh, tên học sinh"));
  }
}
