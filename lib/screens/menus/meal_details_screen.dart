import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_app/screens/cart_screen/cart_controller.dart';

import '../../constants.dart';

class mealDetils extends StatefulWidget {
  //to access index we use (widget.index) => basically to use passed info (widget.argumentName)
  final int index;

  mealDetils({Key? key, required this.index}) : super(key: key);

  @override
  State<mealDetils> createState() => _mealDetilsState();
}

class _mealDetilsState extends State<mealDetils> {
  final cartController = Get.put(CartController());
  final CartController controller = Get.find();
  bool isChecked = false;
  bool isChecked2 = false;
  double price = 0;
  int amount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${MenuItem.menuItemList[widget.index].title} Details"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(MenuItem.menuItemList[widget.index].image),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Description :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(MenuItem.menuItemList[widget.index].description),
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
                      "${MenuItem.menuItemList[widget.index].title} \$${MenuItem.menuItemList[widget.index].price}"),
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
              Divider(
                height: 4,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total is: \$${((price + MenuItem.menuItemList[widget.index].price) * amount).toPrecision(1)}",
                      style: TextStyle(
                          color: Colors.red[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Row(
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
                    )
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      cartController.addMeal(
                          MenuItem.menuItemList[widget.index], amount);
                    },
                    child: Text("Add to Cart"),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
