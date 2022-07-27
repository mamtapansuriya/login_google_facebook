import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  Get.snackbar("message in background Handler", message.notification!.body.toString(), duration: Duration(seconds: 5), backgroundColor: Colors.black);
}

class NotificationService {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static Future<void> initilize() async {
    NotificationSettings setting = await firebaseMessaging.requestPermission();
    final tokenId = await FirebaseMessaging.instance.getToken();
    log("tokenid is=====${tokenId}");
    if (setting.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onBackgroundMessage(backgroundHandler);
      log("Service initilized");
    }
  }
}
