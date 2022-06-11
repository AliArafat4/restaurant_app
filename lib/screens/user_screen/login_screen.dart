import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
            onPressed: () {
              print(email);
              print(password);
            },
            child: Text("Login"))
      ],
    ));
  }
}
