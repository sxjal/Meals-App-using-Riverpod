// ignore_for_file: file_names

import 'package:meals/modal/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/favouriteprovider.dart';

class MealSpecific extends ConsumerWidget {
  MealSpecific({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(context, WidgetRef ref) {
    bool addingstatus = ref.watch(ismealinfavoritesprovider(meal));
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              addingstatus = ref
                  .read(favoritemealsprovider.notifier)
                  .togglemealfavoritestatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(addingstatus
                      ? "Added to favorites"
                      : "Removed from favorites"),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(seconds: 2),
              transitionBuilder: (child, animation) =>
                  SizeTransition(sizeFactor: animation),
              child: addingstatus
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border),
            ), 
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              decoration: const BoxDecoration(
                  //color: Color.fromARGB(182, 67, 96, 100),
                  ),
              child: Column(
                //fit: StackFit.expand,

                //clipBehavior: Clip.antiAliasWithSaveLayer,
                children: [
                  Card(
                    elevation: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        meal.imageUrl,
                        fit: BoxFit.cover,
                        //width: 20,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        meal.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Icon(
                            Icons.bento,
                            color: meal.isLactoseFree
                                ? Colors.greenAccent
                                : Colors.redAccent,
                          ),
                          const Spacer(),
                          Icon(
                            Icons.smoke_free,
                            color: meal.isGlutenFree
                                ? Colors.greenAccent
                                : Colors.redAccent,
                          ),
                          const Spacer(),
                          Icon(
                            Icons.bento,
                            color: meal.isVegan
                                ? Colors.greenAccent
                                : Colors.redAccent,
                          ),
                          const Spacer(),
                          Icon(
                            Icons.smoke_free,
                            color: meal.isVegetarian
                                ? Colors.greenAccent
                                : Colors.redAccent,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Ingredients",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      for (final ingredient in meal.ingredients)
                        Text(
                          ingredient.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: const Color.fromARGB(255, 228, 225, 225),
                              ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Steps",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      for (final steps in meal.steps)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                          child: Text(
                            steps.toString(),
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color:
                                      const Color.fromARGB(255, 228, 225, 225),
                                ),
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
