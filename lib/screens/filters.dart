import 'package:flutter/material.dart';
import 'package:meals/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenfreeset = false;
  var _lactosefreeset = false;
  var _vegetarianset = false;
  var _veganset = false;

  @override
  void initState() {
    super.initState();
    final activefilters = ref.read(filtersprovider);
    _glutenfreeset = activefilters[Filter.GlutenFree]!;
    _lactosefreeset = activefilters[Filter.LactoseFree]!;
    _vegetarianset = activefilters[Filter.Vegetarian]!;
    _veganset = activefilters[Filter.Vegan]!;
  }

  @override
  Widget build(context) {
    return WillPopScope(
      //key: Key("filtersscreen"),
      onWillPop: () async {
        ref.read(filtersprovider.notifier).setfilters({
          Filter.GlutenFree: _glutenfreeset,
          Filter.LactoseFree: _lactosefreeset,
          Filter.Vegetarian: _vegetarianset,
          Filter.Vegan: _veganset,
        });

        return true;
      },
      child: Scaffold(
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
      ),
    );
  }
}
