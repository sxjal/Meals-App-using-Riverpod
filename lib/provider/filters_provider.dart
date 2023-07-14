import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/mealsprovider.dart';

enum Filter {
  GlutenFree,
  LactoseFree,
  Vegetarian,
  Vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.GlutenFree: false,
          Filter.LactoseFree: false,
          Filter.Vegetarian: false,
          Filter.Vegan: false,
        });

  void setfilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void setfilter(Filter filter, bool value) {
    state = {
      ...state,
      filter: value,
    };
  }
}

final filtersprovider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier();
});

final filteredmealsprovider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final _filters = ref.watch(filtersprovider);
  return meals.where((meal) {
    if (_filters[Filter.GlutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (_filters[Filter.LactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (_filters[Filter.Vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (_filters[Filter.Vegan]! && !meal.isVegan) {
      return false;
    }

    return true;
  }).toList();
});
