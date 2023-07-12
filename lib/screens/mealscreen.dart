import 'package:flutter/material.dart';
import 'package:meals/modal/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    this.title,
    required this.meals,
    required this.togglemealfavstatus,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal) togglemealfavstatus;
  @override
  Widget build(context) {
    Widget screen;
    if (meals.isEmpty) {
      screen = const Center(
        child: Text("No meals found!"),
      );
    } else {
      screen = ListView.builder(
        itemBuilder: (ctx, index) =>
            MealItem(meal: meals[index], ontogglefavorite: togglemealfavstatus),
        itemCount: meals.length,
      );
    }

    if (title == null) {
      return screen;
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: Center(
          child: screen,
        ),
      );
    }
  }
}
