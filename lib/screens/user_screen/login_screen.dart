import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_app/screens/user_screen/forget_password_screen.dart';
import 'package:resturant_app/screens/user_screen/sign_up_screen.dart';

import '../food_screen/browse_food.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: buildLoginFormField(),
    );
  }

  Widget buildLoginFormField() {
    return SingleChildScrollView(
      child: SizedBox(
          child: Column(
        children: [
          SizedBox(
              width: 300,
              height: 300,
              child: Image.asset("assets/images/logo.png")),
          const Text("Welcome Back", style: TextStyle(fontSize: 20)),
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
                  //use validate ??
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
                  //use validator ??
                  password = value;
                }),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 25, 0),
              child: GestureDetector(
                  child: const Text(
                    "Forget Password",
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 13),
                  ),
                  onTap: () {
                    //Forget password screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassScreen()));
                    print("henlo");
                  }),
            ),
          ]),
          SizedBox(
            width: 120,
            child: ElevatedButton(
                onPressed: () async {
                  print(email);
                  print(password);
                  Login();
                },
                child: const Text("Login")),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account? ",
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                child: const Text(
                  "Sign-up",
                  style: TextStyle(
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                    color: Colors.blueAccent,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                },
              ),
            ],
          )
        ],
      )),
    );
  }

  Future Login() async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      if (user != null) {
        Get.snackbar("Login Successfully", "",
            duration: const Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => browse()));
      }
    } catch (e) {
      print(e);
      Get.snackbar(
          "Error", "(${email}) does not exist or password is incorrect",
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
