import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:login/Routs/app_routs.dart';

class FacebookController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FacebookAuth facebookAuth = FacebookAuth.instance;
  User? user;
  late Map<String, dynamic> userData;
  Future<User?> signInWithFacebook() async {
    final LoginResult result = await facebookAuth.login(permissions: ['email']);

    if (result.status == LoginStatus.success) {
      userData = await FacebookAuth.instance.getUserData();
    } else {
      print(result.message);
    }

    // final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);

    // return auth.signInWithCredential(facebookAuthCredential);
    final AuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
    final UserCredential userCredential = await auth.signInWithCredential(credential);

    user = userCredential.user;
    if (userCredential != null) {
      log(userCredential.user!.displayName.toString());
      Get.toNamed(Routes.facebookLoginPage);
      Get.snackbar("Success", "Login successfuly");
    }
    return user;
  }

  // Future<void> facebookLogin() async {
  //   try {
  //     log(">>>>>>>>>>00000");
  //     final LoginResult result = await facebookAuth.login(permissions: ['email']); // by default we request the email and the public profile
  //     if (result.status == LoginStatus.success) {
  //       log("result status code===${result.status}");
  //       final AccessToken accessToken = result.accessToken!;
  //       log("accessToken ===${accessToken.toJson()}");
  //       userData = await facebookAuth.getUserData();
  //       if (userData != null) {
  //         log(">>>>>>>>>>>>>>$userData");
  //         Get.toNamed(Routes.facebookLoginPage);
  //       }
  //     } else {
  //       log("result.status ===${result.status}");
  //       log("result.message ===${result.message}");
  //     }
  //   } catch (e, st) {
  //     log("error ===${e} ===stack===$st");
  //   }
  // }
}
