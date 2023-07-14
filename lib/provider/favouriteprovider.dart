//import riverpod
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import meal.dart
import 'package:meals/modal/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool togglemealfavoritestatus(Meal meal) {
    final isfavorite = state.contains(meal);
    if (isfavorite) {
      state = state.where((ele) => meal.id != ele.id ? true : false).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoritemealsprovider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
