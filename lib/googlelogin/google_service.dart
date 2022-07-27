import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/Routs/app_routs.dart';

class Authentication {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential = await auth.signInWithCredential(credential);

        user = userCredential.user;
        if (userCredential != null) {
          Get.toNamed(Routes.googleLoginPage);
          Get.snackbar("Success", "Login successfuly");
        } else {}
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Get.snackbar("Error", 'The account already exists with a different credential.', backgroundColor: Colors.redAccent);
        } else if (e.code == 'invalid-credential') {
          Get.snackbar("Error", 'Error occurred while accessing credentials. Try again.', backgroundColor: Colors.redAccent);
        }
      } catch (e) {
        Get.snackbar("Error", 'Error occurred using Google Sign-In. Try again.', backgroundColor: Colors.redAccent);
      }
    }

    return user;
  }
}
