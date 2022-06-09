import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:resturant_app/screens/cart_screen/cart_controller.dart';

import '../../constants.dart';

class Cart extends StatefulWidget {
  final CartController controller = Get.find();
  final cartController = Get.put(CartController());
  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartController controller = Get.find();
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: buildCartItems(),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Total is: "),
                  Text("\$${controller.totalPrice}"),
                ],
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Purchase"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCartItems() {
    return ListView.builder(
        itemCount: controller.meals.length,
        controller: PageController(viewportFraction: 0.95),
        itemBuilder: (BuildContext context, int index) {
          return SingleChildScrollView(
            child: SizedBox(
              height: 80,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        AspectRatio(
                          aspectRatio: 3 / 2,
                          child: Image.asset(
                            (controller.meals.entries
                                    .map((meal) => meal.key['image'])
                                    .toList()[index])
                                .toString(),
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        SizedBox(width: 5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (controller.meals.entries
                                      .map((meal) => meal.key['meal'])
                                      .toList()[index])
                                  .toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "\$${(controller.meals.entries.map((meal) => meal.key['price']).toList()[index]).toString()} x${controller.meals.values.toList()[index]}"),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.remove_circle,
                              color: Colors.red[700],
                            ),
                            onPressed: () {
                              setState(() {
                                cartController.removeMeal(
                                    controller.meals.keys.toList()[index],
                                    index);
                              });
                            }),
                        Text("${controller.meals.values.toList()[index]}"),
                        IconButton(
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.red[700],
                          ),
                          onPressed: () {
                            setState(() {
                              cartController.addMealFromDB(
                                controller.meals.keys.toList()[index],
                                1,
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
