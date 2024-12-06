import 'package:flutter/material.dart';
import 'package:freelance_hair_colorplus/models/custom_hair_profile.dart';

class FilterScreen extends StatefulWidget {
  final Set<String> appliedCategories;
  final Function(String) toggleCategory;

  const FilterScreen({
    super.key,
    required this.appliedCategories,
    required this.toggleCategory,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late Set<String> appliedCategories;

  @override
  void initState() {
    super.initState();
    appliedCategories = widget.appliedCategories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filters',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
        ),
        itemCount: colorType.keys.length,
        itemBuilder: (context, index) {
          final category = colorType.keys.elementAt(index);
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: categoryColors[category],
            child: Container(
              height: 60,
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    category,
                    style: const TextStyle(color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Checkbox(
                    value: appliedCategories.contains(category),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          appliedCategories.remove(category);
                        } else {
                          appliedCategories.add(category);
                        }
                      });
                      widget.toggleCategory(category);
                    },
                    activeColor: Colors.blue,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
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
    );
  }
}
