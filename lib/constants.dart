import 'package:cloud_firestore/cloud_firestore.dart';

final List<String> imgList = [
  "assets/images/deal1.png",
  "assets/images/deal2.png",
  "assets/images/deal3.png",
];

class category {
  late final String image;
  late final String title;

  category(this.image, this.title);
}

final List<category> categoryList = [
  category("assets/images/pizza.png", "Pizza"),
  category("assets/images/burger.png", "Burger"),
  category("assets/images/dessert.png", "Desserts"),
  category("assets/images/salad.png", "Salad")
];

class MenuItem {
  final String image;
  final String title;
  final double price;
  final String description;
  // late final rate;
  const MenuItem(this.image, this.title, this.price, this.description);

  static const List<MenuItem> menuItemList = [
    MenuItem("assets/images/pizza.png", "pizza", 60.5,
        "The best pizza in the world with cheese, sauce that you cannot resist and extra peperoni."),
    MenuItem(
        "assets/images/dessert.png", "Desserts", 77.2, "The best dessert."),
    MenuItem("assets/images/burger.png", "burger", 50, "The best burger."),
  ];

  // static MenuItem fromSnapshot(DocumentSnapshot snap) {
  //   MenuItem menuItemSnap = MenuItem(
  //       snap['image'], snap['meal'], snap['price'], snap['description']);
  //   return menuItemSnap;
  // }
}

final double cheese = 3;
final double hotSauce = 2;
final double sauce = 0;
