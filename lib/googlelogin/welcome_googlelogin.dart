import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'google_controller.dart';

class GoogleLoginPage extends StatelessWidget {
  GoogleLoginPage({Key? key}) : super(key: key);
  final _googleController = Get.put(GoogleController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Page"),
        actions: [
          RaisedButton(
            onPressed: () async {
              await _googleController.googleSignIn.signOut();
              Get.back();
            },
            child: const Text("Logout"),
          )
        ],
      ),
      body: Center(
        child: Text(_googleController.user!.displayName.toString()),
      ),
    ));
  }
}
