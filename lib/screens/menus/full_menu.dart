import 'package:flutter/material.dart';
import 'package:resturant_app/constants.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({Key? key}) : super(key: key);
  static String routeName = "/menus";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: menuList(),
    );
  }
}

class menuList extends StatefulWidget {
  const menuList({Key? key}) : super(key: key);

  @override
  State<menuList> createState() => _menuListState();
}

class _menuListState extends State<menuList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menuItemList.length,
      itemBuilder: (BuildContext context, int index) {
        return SingleChildScrollView(
          child: SizedBox(
            height: 90,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AspectRatio(
                    aspectRatio: 3 / 2,
                    child: Image.asset(
                      menuItemList[index].image,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        menuItemList[index].title,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "\$${menuItemList[index].price}",
                        style: TextStyle(color: Colors.red[700]),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Add to Cart"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
