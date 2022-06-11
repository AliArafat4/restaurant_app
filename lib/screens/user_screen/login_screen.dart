import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: buildEmailFormField(),
    );
  }

  Widget buildEmailFormField() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            // counterText: '${0} characters',
            suffixIcon: Icon(Icons.mail),
            hintText: "Enter Your Email",
            labelText: 'Email',
          ),

          // onChanged: (
          //
          // ),
        ),
      ),
    );
  }
}
