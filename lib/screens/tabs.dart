import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/mealscreen.dart';
import 'package:meals/widgets/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/favouriteprovider.dart';
import 'package:meals/provider/filters_provider.dart';

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
  int _selectedpageindex = 0;

  void _selectpage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  void onSelectScreen(String screen) async {
    Navigator.of(context).pop();
    if (screen == "Meals") {
    } else if (screen == "Filtered") {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) {
            return const FiltersScreen();
          },
        ),
      );

      //print(result);
    }
  }

  @override
  Widget build(context) {
    //to listen to the data porvided by the porvider
    //ref.read()

    //to reexecute the build method
    //ref.watch()

    //final meals = ref.watch(mealsProvider);
    //final _filters = ref.watch(filtersprovider);
    final avaialblemeals = ref.watch(filteredmealsprovider);

    Widget activestate = CategoriesScreen(availablemeals: avaialblemeals);
    String activepagetitle = "Categories";
    if (_selectedpageindex == 1) {
      final favoriteMeals = ref.watch(favoritemealsprovider);

      activestate = MealScreen(
        meals: favoriteMeals,
      );
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
