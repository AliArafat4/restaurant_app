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
