import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassScreen extends StatelessWidget {
  ForgetPassScreen({Key? key}) : super(key: key);
  late String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
              "Enter your email to receive a link to reset\nyour password",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Email'),
                  hintText: 'Enter your email'),
              onChanged: (value) {
                //validator
                email = value;
              },
            ),
          ),
          SizedBox(height: 5),
          ElevatedButton(
              onPressed: () {
                ResetPass();
              },
              child: Text('Reset Password'))
        ],
      ),
    );
  }

  Future ResetPass() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      Get.snackbar("password reset",
          "you have received and email to reset your password",
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("password reset", "Enter a valid email",
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
