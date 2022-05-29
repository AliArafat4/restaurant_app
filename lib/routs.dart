import 'package:flutter/material.dart';
import 'package:resturant_app/screens/food_screen/browse_food.dart';
import 'package:resturant_app/screens/menus/full_menu.dart';

final Map<String, WidgetBuilder> routes = {
  browse.routeName: (context) => browse(),
  FoodMenu.routeName: (context) => FoodMenu(),
};
