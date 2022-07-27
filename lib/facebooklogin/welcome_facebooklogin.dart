import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'facebook_controller.dart';

class FacebookLoginPage extends StatelessWidget {
  FacebookLoginPage({Key? key}) : super(key: key);
  final _facebookController = Get.put(FacebookController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Page"),
        actions: [
          RaisedButton(
            onPressed: () async {
              _facebookController.facebookAuth.logOut();
              Get.back();
            },
            child: const Text("Logout"),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 15.w,
                  backgroundImage: NetworkImage(_facebookController.userData['picture']['data']['url'] ??
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkbYw73-X3jsq5RY-o2BpqIVTuf7aH4DDCXg&usqp=CAU"),
                ),
                Text(
                  _facebookController.userData['name'].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(_facebookController.userData["email"].toString())
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
