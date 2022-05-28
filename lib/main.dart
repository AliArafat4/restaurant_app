import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resturant_app/screens/start_screen/start.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.red[700],
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The restaurant',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const start(),
      // Scaffold(
      //   appBar: AppBar(
      //     title: const Text("Restaurant"),
      //     backgroundColor: Colors.red[700],
      //   ),
      // ),
    );
  }
}
