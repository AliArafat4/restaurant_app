import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_app/constants.dart';
import 'package:resturant_app/screens/cart_screen/cart_controller.dart';

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

// class menuList extends StatelessWidget {
//   final cartController = Get.put(CartController());
//   menuList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: MenuItem.menuItemList.length,
//       itemBuilder: (BuildContext context, int index) {
//         return SingleChildScrollView(
//           child: SizedBox(
//             height: 90,
//             child: Card(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       AspectRatio(
//                         aspectRatio: 3 / 2,
//                         child: Image.asset(
//                           MenuItem.menuItemList[index].image,
//                           alignment: Alignment.centerLeft,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 3,
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             MenuItem.menuItemList[index].title,
//                             style: TextStyle(
//                               fontSize: 17,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             "\$${MenuItem.menuItemList[index].price}",
//                             style: TextStyle(color: Colors.red[700]),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       print(index);
//                       cartController.addMeal(MenuItem.menuItemList[index]);
//                     },
//                     child: Text("Add to Cart"),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class menuList extends StatefulWidget {
  menuList({Key? key}) : super(key: key);

  @override
  State<menuList> createState() => _menuListState();
}

class _menuListState extends State<menuList> {
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: MenuItem.menuItemList.length,
      itemBuilder: (BuildContext context, int index) {
        return SingleChildScrollView(
          child: SizedBox(
            height: 90,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Image.asset(
                          MenuItem.menuItemList[index].image,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Column(
                        children: [
                          Text(
                            MenuItem.menuItemList[index].title,
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "\$${MenuItem.menuItemList[index].price}",
                            style: TextStyle(color: Colors.red[700]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      cartController.addMeal(MenuItem.menuItemList[index]);
                    },
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
