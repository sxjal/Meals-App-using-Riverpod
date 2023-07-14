import 'package:flutter_riverpod/flutter_riverpod.dart';

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
