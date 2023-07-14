import 'package:flutter/material.dart';
import 'package:meals/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  
  @override
  Widget build(context, WidgetRef ref) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Filters"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              value: _glutenfreeset,
              onChanged: (newvalue) {
                setState(() {
                  _glutenfreeset = newvalue;
                });
              },
              title: Text(
                "Gluten-Free",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                "Only include gluten-free meals.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              activeColor: Theme.of(context).colorScheme.primary,
            ),
            SwitchListTile(
              value: _lactosefreeset,
              onChanged: (newvalue) {
                setState(() {
                  _lactosefreeset = newvalue;
                });
              },
              title: Text(
                "Lactose-Free",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                "Only include lactose-free meals.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              activeColor: Theme.of(context).colorScheme.primary,
            ),
            SwitchListTile(
              value: _veganset,
              onChanged: (newvalue) {
                setState(() {
                  _veganset = newvalue;
                });
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                "Only include Vegan meals.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              activeColor: Theme.of(context).colorScheme.primary,
            ),
            SwitchListTile(
              value: _vegetarianset,
              onChanged: (newvalue) {
                setState(() {
                  _vegetarianset = newvalue;
                });
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                "Only include Vegetarian meals.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              activeColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      
    );
  }
}
