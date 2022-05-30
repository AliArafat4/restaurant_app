import 'package:get/get.dart';

import '../../constants.dart';

class CartController extends GetxController {
  final _meal = {}.obs;

  void addMeal(MenuItem meal) {
    if (_meal.containsKey(meal)) {
      _meal[meal] += 1;
    } else {
      _meal[meal] = 1;
    }
    Get.snackbar("Meal Added",
        "You have added ${_meal[meal]}x ${meal.title} to the cart",
        duration: Duration(seconds: 2), snackPosition: SnackPosition.BOTTOM);
  }

  get meals => _meal;
}
