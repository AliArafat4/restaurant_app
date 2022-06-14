import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../food_screen/browse_food.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String phoneNumber;
  late String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign-up")),
      body: buildEmailFormField(),
    );
  }

  Widget buildEmailFormField() {
    return SingleChildScrollView(
      child: SizedBox(
          child: Column(
        children: [
          SizedBox(
              width: 300,
              height: 300,
              child: Image.asset("assets/images/logo.png")),
          const Text("Register a new account", style: TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  // counterText: '${0} characters',
                  suffixIcon: Icon(Icons.mail),
                  hintText: "Enter Your Email",
                  labelText: 'Email',
                ),
                onChanged: (value) {
                  //validator ?
                  email = value;
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                autocorrect: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  // counterText: '${0} characters',
                  suffixIcon: Icon(Icons.key),
                  hintText: "Enter Your Password",
                  labelText: 'Password',
                ),
                onChanged: (value) {
                  //validator ??
                  password = value;
                }),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                autocorrect: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  // counterText: '${0} characters',
                  suffixIcon: Icon(Icons.key),
                  hintText: "Enter Your Name",
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  //validator ??
                  name = value;
                }),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                autocorrect: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  // counterText: '${0} characters',
                  suffixIcon: Icon(Icons.phone_android),
                  hintText: "Enter Your Phone Number",
                  labelText: 'Phone Number',
                ),
                onChanged: (value) {
                  //validator ??
                  phoneNumber = value;
                }),
          ),
          const SizedBox(height: 10),
          SizedBox(
              width: 120,
              child: ElevatedButton(
                  onPressed: () async {
                    createUser(email, name, phoneNumber);
                    SignUp();
                  },
                  child: const Text("Register"))),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already registered? ",
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                    color: Colors.blueAccent,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              ),
            ],
          )
        ],
      )),
    );
  }

  Future createUser(String email, String name, String phone) async {
    if (email != null && name != null && phone != null) {
      final users = FirebaseFirestore.instance.collection("users").doc();
      final json = {
        'email': email,
        'name': name,
        'phone': phone,
      };
      await users.set(json);
    } else {
      Get.snackbar("Error", "Fields cannot be empty");
    }
  }

  Future SignUp() async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final User updateUserName = _auth.currentUser!;
      updateUserName.updateDisplayName(name);
      if (newUser != null) {
        Get.snackbar("Account Registered Successfully", "",
            duration: const Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => browse()));
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Account is registered or is wrong",
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
