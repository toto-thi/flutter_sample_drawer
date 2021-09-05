import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_navigator/widget/ButtonWidget.dart';
import 'widget/NavigationDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test Routing",
      theme: ThemeData(primarySwatch: Colors.orange),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //endDrawer: NavigationDrawer(),
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) => Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          alignment: Alignment.center,
          child: ButtonWidget(
              icon: Icons.open_in_new,
              text: 'Open Drawer',
              onClicked: () {
                Scaffold.of(context).openDrawer();
                // Scaffold.of(context).openEndDrawer();
              }),
        ),
      ),
    );
  }
}
