import 'package:flutter/material.dart';

class WelcomeNotify extends StatelessWidget {
  WelcomeNotify({Key? key, this.name}) : super(key: key);
  String? name;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Notification Demo")),
      body: Center(
        child: Text(name!),
      ),
    ));
  }
}
