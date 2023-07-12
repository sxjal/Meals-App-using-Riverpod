import 'package:flutter/material.dart';

enum Filter {
  GlutenFree,
  LactoseFree,
  Vegetarian,
  Vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentfilters});
  final Map<Filter, bool> currentfilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenfreeset = false;
  var _lactosefreeset = false;
  var _vegetarianset = false;
  var _veganset = false;

  @override
  void initState() {
    _glutenfreeset = widget.currentfilters[Filter.GlutenFree]!;
    _lactosefreeset = widget.currentfilters[Filter.LactoseFree]!;
    _vegetarianset = widget.currentfilters[Filter.Vegetarian]!;
    _veganset = widget.currentfilters[Filter.Vegan]!;
    super.initState();
  }

  @override
  Widget build(context) {
    return WillPopScope(
      //key: Key("filtersscreen"),
      onWillPop: () async {
        Navigator.of(context).pop({
          Filter.GlutenFree: _glutenfreeset,
          Filter.LactoseFree: _lactosefreeset,
          Filter.Vegetarian: _vegetarianset,
          Filter.Vegan: _veganset,
        });
        return false;
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
