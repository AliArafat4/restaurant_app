import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:resturant_app/screens/start_screen/start.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Restaurant',
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
