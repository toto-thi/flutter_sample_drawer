import 'package:flutter/material.dart';
import 'package:test_navigator/widget/NavigationDrawer.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text("People Page"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
    );
  }
}
