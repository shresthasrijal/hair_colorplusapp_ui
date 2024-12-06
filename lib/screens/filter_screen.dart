import 'package:flutter/material.dart';
import 'package:freelance_hair_colorplus/models/custom_hair_profile.dart';

class FilterScreen extends StatelessWidget {
  final Set<String> appliedCategories;
  final Function(String) toggleCategory;

  const FilterScreen({
    super.key,
    required this.appliedCategories,
    required this.toggleCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          ...colorType.keys.map((category) {
            return CheckboxListTile(
              value: appliedCategories.contains(category),
              onChanged: (bool? value) {
                toggleCategory(category);
              },
              title: Text(
                category,
                style: const TextStyle(color: Colors.white),
              ),
              activeColor: Colors.blue,
            );
          }),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text('Apply Filters'),
            ),
          ),
        ],
      ),
    );
  }
}
