import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String name;
  final String urlImg;

  const UserPage({Key? key, required this.name, required this.urlImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Image.network(
        urlImg,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
