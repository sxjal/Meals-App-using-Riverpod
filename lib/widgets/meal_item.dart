import 'package:flutter/material.dart';
import 'package:meals/modal/meal.dart';
import 'package:meals/screens/mealspecific.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key, required this.meal, required this.ontogglefavorite});
  final Meal meal;
  final void Function(Meal) ontogglefavorite;

  String get complexitytext {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilitytext {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        autofocus: true,
        //hoverColor: Colors.black54,
        splashColor: Theme.of(context).colorScheme.surface,
        onTap: () {
          // print("printed");
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return MealSpecific(
              meal: meal,
              ontogglefavorite: ontogglefavorite,
            );
          }));
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 00,
              left: 00,
              right: 00,
              //top: 10,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Trait(
                          icon: Icons.schedule,
                          text: '${meal.duration} min',
                        ),
                        const Spacer(),
                        Trait(
                          icon: Icons.work,
                          text: '$complexitytext min',
                        ),
                        const Spacer(),
                        Trait(
                          icon: Icons.attach_money,
                          text: affordabilitytext,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
