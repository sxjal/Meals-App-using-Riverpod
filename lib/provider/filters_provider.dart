import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  GlutenFree,
  LactoseFree,
  Vegetarian,
  Vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter,bool>>{

}
final filtersprovider = StateNotifierProvider<>((ref) {
  return FiltersNotifier();
});