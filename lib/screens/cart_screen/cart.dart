import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:resturant_app/screens/cart_screen/cart_controller.dart';

class Cart extends StatefulWidget {
  final CartController controller = Get.find();

  Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: buildCartItems(),
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
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 2,
                      child: Image.asset(
                        controller.meals.keys.toList()[index].image,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(controller.meals.keys.toList()[index].title),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            "\$${controller.meals.keys.toList()[index].price}x${controller.meals.values.toList()[index]}"),
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
