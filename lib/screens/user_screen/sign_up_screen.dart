import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign-up"),
      ),
      body: buildEmailFormField(),
    );
  }

  Widget buildEmailFormField() {
    return SizedBox(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              // counterText: '${0} characters',
              suffixIcon: Icon(Icons.mail),
              hintText: "Enter Your Email",
              labelText: 'Email',
            ),
            onChanged: (value) {
              email = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            autocorrect: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              // counterText: '${0} characters',
              suffixIcon: Icon(Icons.key),
              hintText: "Enter Your Password",
              labelText: 'Password',
            ),
            onChanged: (value) {
              password = value;
            },
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              print(email);
              print(password);
              try {
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (newUser != null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => browse()));
                }
              } catch (e) {
                print(e);
              }
            },
            child: Text("Register"))
      ],
    ));
  }
}
