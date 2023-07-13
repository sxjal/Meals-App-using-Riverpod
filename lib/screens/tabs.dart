import 'package:flutter/material.dart';
import 'package:meals/modal/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/mealscreen.dart';
import 'package:meals/widgets/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/mealsprovider.dart';

const kinitialfilters = {
  Filter.GlutenFree: false,
  Filter.LactoseFree: false,
  Filter.Vegan: false,
  Filter.Vegetarian: false,
};

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() => _TabsState();
}

class _TabsState extends ConsumerState<Tabs> {
  Map<Filter, bool> _filters = kinitialfilters;
  int _selectedpageindex = 0;
  final List<Meal> favoriteMeals = [];

  void _selectpage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  void showinfomessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _togglemealfavstatus(Meal meal) {
    final isexisting = favoriteMeals.contains(meal);
    setState(() {
      if (isexisting) {
        favoriteMeals.remove(meal);
        showinfomessage("Removed from favorites!");
      } else {
        favoriteMeals.add(meal);
        showinfomessage("Added to favorites!");
      }
    });
  }

  void onSelectScreen(String screen) async {
    Navigator.of(context).pop();
    if (screen == "Meals") {
    } else if (screen == "Filtered") {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) {
            return FiltersScreen(
              currentfilters: _filters,
            );
          },
        ),
      );
      setState(() {
        _filters = result ?? kinitialfilters;
      });
      //print(result);
    }
  }

  @override
  Widget build(context) {
    //to listen to the data porvided by the porvider
    //ref.read()

    //to reexecute the build method
    //ref.watch()
    final meals = ref.watch(mealsProvider);
    final avaialblemeals = meals.where((meal) {
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

    Widget activestate = CategoriesScreen(
        ontogglefavorite: _togglemealfavstatus, availablemeals: avaialblemeals);
    String activepagetitle = "Categories";
    if (_selectedpageindex == 1) {
      activestate = MealScreen(
          meals: favoriteMeals, togglemealfavstatus: _togglemealfavstatus);
      activepagetitle = "Favorites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      drawer: MainDrawer(onSelectScreen: onSelectScreen),
      body: activestate,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        currentIndex: _selectedpageindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.set_meal,
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
