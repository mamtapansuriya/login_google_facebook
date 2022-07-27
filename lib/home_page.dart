import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Pushnotification/notification_controller.dart';
import 'package:login/googlelogin/google_service.dart';

import 'facebooklogin/facebook_controller.dart';
import 'googlelogin/google_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _notifyController = Get.put(NotificationController());
  final _googleController = Get.put(GoogleController());

  final _facebookController = Get.put(FacebookController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Login Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await _googleController.signInWithGoogle(context);
                },
                child: Text("Google Login")),
            ElevatedButton(
                onPressed: () async {
                  await _facebookController.signInWithFacebook();
                },
                child: Text("Facebook Login"))
          ],
        ),
      ),
    ));
  }
}
