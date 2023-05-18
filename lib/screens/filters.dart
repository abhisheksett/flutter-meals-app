import 'package:flutter/material.dart';
import 'package:flutter_meal_app/screens/tabs.dart';
import 'package:flutter_meal_app/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  final Map<Filter, bool> currentFilters;

  const FiltersScreen({super.key, required this.currentFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _veganFilterSet = false;
  var _vegeterianFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
    _vegeterianFilterSet = widget.currentFilters[Filter.vegetarian]!;
  }

  // void _setScreen(String screen) {
  //   Navigator.of(context).pop();
  //   if (screen == 'meals') {
  //     Navigator.of(context).pop();
  //     Navigator.of(context).push(
  //       MaterialPageRoute(builder: (ctx) => const TabsScreen()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: _setScreen),
      body: WillPopScope(
        onWillPop: () async {
          // async will automatically wrap the return in a Future
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.vegetarian: _vegeterianFilterSet,
            Filter.vegan: _veganFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include gluten free meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: colorScheme.onBackground),
              ),
              activeColor: colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include lactose free meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: colorScheme.onBackground),
              ),
              activeColor: colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegeterianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegeterianFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegetarian meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: colorScheme.onBackground),
              ),
              activeColor: colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: colorScheme.onBackground),
              ),
              activeColor: colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      ),
    );
  }
}
