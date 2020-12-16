import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  Function onChange;

  HomeSearchBar({this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: onChange,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.search),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            hintText: "Mã học sinh, tên học sinh"));
  }
}
