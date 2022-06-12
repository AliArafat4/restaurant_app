import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'meal_details_screen.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({Key? key}) : super(key: key);

  static String routeName = "/menus";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu")),
      body: menuList(),
    );
  }
}

class menuList extends StatefulWidget {
  menuList({Key? key}) : super(key: key);

  @override
  State<menuList> createState() => _menuListState();
}

class _menuListState extends State<menuList> {
  final Stream<QuerySnapshot> meals =
      FirebaseFirestore.instance.collection('meals').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: meals,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [Center(child: CircularProgressIndicator())],
            );
          }
          final data = snapshot.requireData;
          //not nessessary ?
          if (data.docs.isEmpty) {
            return const Text("empty");
          }
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
                                    Text("\$${data.docs[index]['price']}",
                                        style:
                                            TextStyle(color: Colors.red[700])),
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
                        }),
                  ),
                );
              });
        });

    //   ListView.builder(
    //   itemCount: MenuItem.menuItemList.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return SingleChildScrollView(
    //       child: SizedBox(
    //         height: 90,
    //         child: GestureDetector(
    //           child: Card(
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Row(
    //                   children: [
    //                     AspectRatio(
    //                       aspectRatio: 3 / 2,
    //                       child: Image.asset(
    //                         MenuItem.menuItemList[index].image,
    //                         alignment: Alignment.centerLeft,
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       width: 3,
    //                     ),
    //                     Column(
    //                       children: [
    //                         Text(
    //                           MenuItem.menuItemList[index].title,
    //                           style: TextStyle(
    //                             fontSize: 17,
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: 20,
    //                         ),
    //                         Text(
    //                           "\$${MenuItem.menuItemList[index].price}",
    //                           style: TextStyle(color: Colors.red[700]),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //           onTap: () {
    //             mealDetils(index: index);
    //             Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                     builder: (context) => mealDetils(index: index)));
    //           },
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
