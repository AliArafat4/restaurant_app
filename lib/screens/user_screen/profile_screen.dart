import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Column(
        children: [
          Center(
              child: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 60,
                foregroundImage: Image.asset("assets/images/burger.png").image,
              ),
              Positioned(
                  bottom: 0,
                  right: -25,
                  child: RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Color(0xFFF5F6F9),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.blue,
                    ),
                    padding: EdgeInsets.all(8.0),
                    shape: CircleBorder(),
                  )),
            ],
          )),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
                child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  enabled: false,
                  isDense: true,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  hintText: "Ali Arafat",
                  hintStyle: TextStyle(color: Colors.red)),
            )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
                child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  enabled: false,
                  isDense: true,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  hintText: "AliArafat@gmail.com",
                  hintStyle: TextStyle(color: Colors.red)),
            )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
                child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  enabled: false,
                  isDense: true,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  hintText: "0503653350",
                  hintStyle: TextStyle(color: Colors.red)),
            )),
          ),
        ],
      ),
    );
  }
}
