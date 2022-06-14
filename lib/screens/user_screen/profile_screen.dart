import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? userName;
  final _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;
  bool isEnabled = false;
  String? phoneNum;

  final Stream<QuerySnapshot> getPhoneNumber =
      FirebaseFirestore.instance.collection('users').snapshots();

  Future UpdateName(String name) async {
    final user = _auth.currentUser!;
    user.updateDisplayName(name);

    final updateUser = FirebaseFirestore.instance.collection('users');
    FirebaseFirestore.instance
        .collection('users')
        .where("email", isEqualTo: '${user.email}')
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.forEach((doc) => updateUser
                ..doc(doc.id).update({
                  'name': name,
                }))
            });
  }

  Future getPhone() async {
    // final getPhone = FirebaseFirestore.instance.collection('users');
    final getPhoneNumber = FirebaseFirestore.instance
        .collection('users')
        .where("email", isEqualTo: '${user.email}')
        .get()
        .then((querySnapshot) => {querySnapshot.docs[0]['phone']});

    return "${getPhoneNumber.then((value) => value)}";
  }

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
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.blue,
                    ),
                    padding: EdgeInsets.all(8.0),
                    shape: CircleBorder(),
                  )),
            ],
          )),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        enabled: isEnabled,
                        isDense: true,
                        filled: true,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        hintText: user.displayName,
                        hintStyle: const TextStyle(color: Colors.red)),
                    onFieldSubmitted: (value) {
                      setState(() {
                        userName = value;
                      });

                      if (userName != null) {
                        isEnabled = !isEnabled;
                        UpdateName(userName!);
                      }
                    },
                  ),
                  Positioned(
                    right: 5,
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.grey[600]),
                        onPressed: () {
                          setState(() {
                            isEnabled = !isEnabled;
                          });
                        },
                        child: const Text("Edit")),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
                child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  enabled: false,
                  isDense: true,
                  filled: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  hintText: user.email,
                  hintStyle: const TextStyle(color: Colors.red)),
            )),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                child: StreamBuilder<QuerySnapshot>(
                  stream: getPhoneNumber,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    final getPhoneNumber = FirebaseFirestore.instance
                        .collection('users')
                        .where("email",
                            isEqualTo:
                                '${FirebaseAuth.instance.currentUser!.email}')
                        .get()
                        .then((querySnapshot) =>
                            {querySnapshot.docs[0]['phone']});
                    return TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          enabled: false,
                          isDense: true,
                          filled: true,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          hintText: "${snapshot.data?.docs[0]['phone']}",
                          hintStyle: const TextStyle(color: Colors.red)),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}
