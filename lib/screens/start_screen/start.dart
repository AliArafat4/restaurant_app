// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:flutter/material.dart';

import '../food_screen/browse_food.dart';

class start extends StatelessWidget {
  const start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(milliseconds: 1400),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const browse(),
            )));
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 700),
              child: Image.asset(
                "assets/images/logo.png",
                scale: 2,
              ),
            )
          ],
        ),
      )),
    );
  }
}
