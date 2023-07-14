import 'package:flutter/material.dart';
import 'package:meals/modal/meal.dart';
import 'package:meals/screens/mealscreen.dart';
import 'package:meals/widgets/grid_data.dart';
import 'package:meals/data/data.dart';
import 'package:meals/modal/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availablemeals});

  final List<Meal> availablemeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
      duration: const Duration(seconds: 2),
      lowerBound: 0,
      upperBound: 20,
    );

    _animationController.forward();

    //_animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availablemeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
    //Navigator.of(context).push(route);
  }

  @override
  Widget build(context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // ...avaialbleCategories.map((category) {
          //   return GridData(
          //     category: category,
          //     selectCategory: () {
          //       selectCategory(context);
          //     },
          //   );
          // }).toList(),
          for (final category in avaialbleCategories)
            GridData(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
      builder: (context, child) => SlideTransition(
        position: _animationController.drive(
          Tween(),
        ),
        child: child,
      ),
    );
  }
}
