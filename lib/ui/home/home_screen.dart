import 'package:demo_provider/ui/home/home_provider.dart';
import 'package:demo_provider/ui/home/view_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => new HomeProvider.getListUsers(1),
      builder: (context, child) => Consumer<HomeProvider>(
          builder: (context, value, child) => ListView.builder(
                itemCount: value.dataResponse.length,
                itemBuilder: (context, index) {
                  return ItemUser(value.dataResponse[index]);
                },
              )),
    ));
  }
}
