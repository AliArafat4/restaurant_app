import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'meal_details_screen.dart';

class CategoryScreen extends StatefulWidget {
  String title;

  CategoryScreen(this.title, {Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: categoryBuilder(context));
  }

  Widget categoryBuilder(BuildContext context) {
    //Stream<QuerySnapshot> might cause an error?
    final Stream<QuerySnapshot> types = FirebaseFirestore.instance
        .collectionGroup('categories ${widget.title}')
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: types,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Center(child: CircularProgressIndicator())],
            );
          }

          final data = snapshot.requireData;

          return ListView.builder(
              itemCount: data.size,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: SizedBox(
                      height: 90,
                      child: GestureDetector(
                        child: Card(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  AspectRatio(
                                    aspectRatio: 3 / 2,
                                    child: Image.asset(
                                        data.docs[index]['image'],
                                        alignment: Alignment.centerLeft),
                                  ),
                                  const SizedBox(width: 3),
                                  Column(children: [
                                    Text(
                                      data.docs[index]['meal'],
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      "\$${data.docs[index]['price']}",
                                      style: TextStyle(color: Colors.red[700]),
                                    ),
                                  ]),
                                ]),
                              ]),
                        ),
                        onTap: () {
                          mealDetils(index: index, data: data);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      mealDetils(index: index, data: data)));
                        },
                      )),
                );
              });
        });
  }

  // Future<void> getCollectionData(String meal) async {
  //   late var docs;
  //   final type = await FirebaseFirestore.instance
  //       .collectionGroup('categories ${meal}')
  //       .get()
  //       .then((QuerySnapshot snapshot) {
  //     docs = snapshot.docs;
  //
  //     for (var data in docs) {
  //       print(data.data());
  //       // print(data.reference);
  //     }
  //   });
  // }

  // Future<void> getmeals() async {
  //   await for (var snapshot
  //       in FirebaseFirestore.instance.collection('meals').snapshots()) {
  //     for (var types in snapshot.docs) {
  //       print(types.data());
  //     }
  //   }
  // }
}
