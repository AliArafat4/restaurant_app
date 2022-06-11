import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_app/screens/cart_screen/cart_controller.dart';

import '../../constants.dart';

import '../cart_screen/cart.dart';

class mealDetils extends StatefulWidget {
  //to access index we use (widget.index) => basically to use passed info (widget.argumentName)
  final int index;
  final data;
  mealDetils({Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  State<mealDetils> createState() => _mealDetilsState();
}

class _mealDetilsState extends State<mealDetils> {
  final cartController = Get.put(CartController());
  final Stream<QuerySnapshot> meals =
      FirebaseFirestore.instance.collection('meals').snapshots();
  final CartController controller = Get.find();
  bool isChecked = false;
  bool isChecked2 = false;
  double price = 0;
  int amount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<QuerySnapshot>(
          stream: meals,
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (snapshot.hasError) {
              return Text("Error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text("Loading")],
              );
            }
            //final data = snapshot.requireData;
            return Text("${widget.data.docs[widget.index]["meal"]} Details");
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              final cartController = Get.put(CartController());
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
        ],
      ),
      body: buildMealDetails(context),
    );
  }

  Widget buildMealDetails(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: meals,
      builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot,
      ) {
        if (snapshot.hasError) {
          return Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text("Loading")],
          );
        }
        // final data = snapshot.requireData;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.data.docs[widget.index]['image']),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Description :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(widget.data.docs[widget.index]['description']),
              ),
              Row(
                children: [
                  Theme(
                    data: Theme.of(context)
                        .copyWith(disabledColor: Colors.red[700]),
                    child: Radio(
                      value: 1,
                      groupValue: 1,
                      onChanged: null,
                    ),
                  ),
                  Text(
                      "${widget.data.docs[widget.index]['meal']} \$${widget.data.docs[widget.index]['price']}"),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                          if (isChecked)
                            price += cheese;
                          else
                            price -= cheese;
                        });
                      }),
                  Text("Extra Cheese \$${cheese}"),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: isChecked2,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked2 = value!;
                          if (isChecked2)
                            price += hotSauce;
                          else
                            price -= hotSauce;
                        });
                      }),
                  Text("Hot Sauce \$${hotSauce}"),
                ],
              ),
              Divider(height: 4, thickness: 1),
              Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total is: \$${((price + widget.data.docs[widget.index]['price']) * amount).toPrecision(1)}",
                      style: TextStyle(
                          color: Colors.red[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    buildAddRemoveMeals()
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      // var mealEntries = controller.meals.entries
                      //     .map((meal) => meal.key['meal'])
                      //     .toList();
                      // print(mealEntries
                      //     .contains(data.docs[widget.index]['meal']));
                      // if (!mealEntries
                      //     .contains(data.docs[widget.index]['meal']))
                      cartController.addMealFromDB(
                        widget.data.docs[widget.index],
                        amount,
                      );
                      // else
                      //   cartController.addMealFromDB(
                      //     controller.meals.keys.toList(),
                      //     amount,
                      //   );
                      // print(data.docs[widget.index]['price']);
                    },
                    child: Text("Add to Cart"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildAddRemoveMeals() {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.remove_circle,
            color: Colors.red[700],
          ),
          onPressed: () {
            if (amount > 1) {
              setState(() {
                amount -= 1;
              });
            }
          },
        ),
        Text("${amount}"),
        IconButton(
          icon: Icon(
            Icons.add_circle,
            color: Colors.red[700],
          ),
          onPressed: () {
            setState(() {
              amount += 1;
            });
          },
        ),
      ],
    );
  }
}
