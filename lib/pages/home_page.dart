import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Container(
          child: Text('Hello'),
        ),
      ),
    );
  }
}