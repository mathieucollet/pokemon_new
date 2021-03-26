import 'package:flutter/material.dart';
import 'package:pokemon_new/model/set_model.dart';
import 'package:pokemon_new/style/colors.dart';

import 'my_app_bar.dart';
import 'my_drawer.dart';

class MyScaffold extends StatefulWidget {
  SetModel set;
  var body;
  SetModel goBackToSet;
  bool goBackToMain;

  MyScaffold({this.body, this.goBackToSet, this.set, this.goBackToMain});
  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: MyAppBar(
          goBackToSet: this.widget.goBackToSet,
          goBackToMain: this.widget.goBackToMain,
          set: this.widget.set),
      drawer: Drawer(child: MyDrawer()),
      body: this.widget.body,
    );
  }
}
