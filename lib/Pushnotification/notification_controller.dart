import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Pushnotification/local_notification.dart';
import 'package:login/Pushnotification/welcome_page.dart';

import 'notification_service.dart';

class NotificationController extends GetxController {
  final firebaseMessaging = NotificationService.firebaseMessaging;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInitialMessage();
    FirebaseMessaging.onMessage.listen((message) {
      LocalNotification.createanddisplaynotification(message);
      // Get.snackbar("OnMessage", message.notification!.body.toString(), duration: Duration(seconds: 5), backgroundColor: Colors.green);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      //LocalNotification.createanddisplaynotification(message);
      //Get.snackbar("onMessageOpenApp", message.notification!.body.toString(), duration: Duration(seconds: 5), backgroundColor: Colors.orange);
    });
  }

  void getInitialMessage() async {
    RemoteMessage? message = await firebaseMessaging.getInitialMessage();
    if (message != null) {
      Get.to(WelcomeNotify(name: message.data['name']));
    }
  }
}
