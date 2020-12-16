import 'package:demo_provider/ui/home/home_list_student.dart';
import 'package:demo_provider/ui/home/home_provider.dart';
import 'package:demo_provider/ui/home/home_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => new HomeProvider.getListUsers(),
      builder: (context, child) => Consumer<HomeProvider>(
          builder: (context, provider, child) => SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: HomeSearchBar()),
                      Expanded(
                        child: HomeListStudent(),
                      ),
                    ],
                  ),
                ),
              )),
    ));
  }
}
