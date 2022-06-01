import 'package:get/get.dart';

import '../../constants.dart';

class CartController extends GetxController {
  final _meal = {}.obs;

  void addMeal(MenuItem meal, int amount) {
    if (_meal.containsKey(meal)) {
      _meal[meal] += amount;
    } else {
      _meal[meal] = amount;
    }
    Get.snackbar("Meal Added",
        "You have added ${_meal[meal]}x ${meal.title} to the cart",
        duration: Duration(seconds: 2), snackPosition: SnackPosition.BOTTOM);
  }

  void removeMeal(MenuItem meal) {
    if (_meal.containsKey(meal) && _meal[meal] == 1) {
      _meal.removeWhere((key, value) => key == meal);
    } else {
      _meal[meal] -= 1;
    }
  }

  get meals => _meal;
}
