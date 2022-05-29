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

class menuItem {
  late final String image;
  late final String title;
  late final String price;
  // late final rate;
  menuItem(this.image, this.title, this.price);
}

final List<menuItem> menuItemList = [
  menuItem("assets/images/pizza.png", "pizza", "60"),
  menuItem("assets/images/dessert.png", "Desserts", "77"),
  menuItem("assets/images/pizza.png", "pizza", "60"),
  menuItem("assets/images/burger.png", "burger", "50"),
  menuItem("assets/images/pizza.png", "pizza", "60"),
  menuItem("assets/images/burger.png", "burger", "50"),
  menuItem("assets/images/pizza.png", "pizza", "60"),
  menuItem("assets/images/burger.png", "burger", "50"),
  menuItem("assets/images/pizza.png", "pizza", "60"),
  menuItem("assets/images/burger.png", "burger", "50"),
  menuItem("assets/images/pizza.png", "pizza", "60"),
  menuItem("assets/images/burger.png", "burger", "50"),
];
