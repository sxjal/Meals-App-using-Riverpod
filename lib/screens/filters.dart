import 'package:flutter/material.dart';
import 'package:meals/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    final activefilters = ref.watch(filtersprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            value: activefilters[Filter.GlutenFree]!,
            onChanged: (newvalue) {
              ref
                  .read(filtersprovider.notifier)
                  .setfilter(Filter.GlutenFree, newvalue);
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
            value: activefilters[Filter.LactoseFree]!,
            onChanged: (newvalue) {
              ref
                  .read(filtersprovider.notifier)
                  .setfilter(Filter.LactoseFree, newvalue);
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
            value: activefilters[Filter.Vegan]!,
            onChanged: (newvalue) {
              ref
                  .read(filtersprovider.notifier)
                  .setfilter(Filter.Vegan, newvalue);
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
            value: activefilters[Filter.Vegetarian]!,
            onChanged: (newvalue) {
              ref
                  .read(filtersprovider.notifier)
                  .setfilter(Filter.Vegetarian, newvalue);
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
