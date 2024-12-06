import 'package:flutter/material.dart';
import 'package:freelance_hair_colorplus/models/custom_hair_profile.dart';
import 'package:freelance_hair_colorplus/screens/filter_screen.dart';

class SwatchbookScreen extends StatefulWidget {
  const SwatchbookScreen({super.key});

  @override
  State<SwatchbookScreen> createState() => _SwatchbookScreenState();
}

class _SwatchbookScreenState extends State<SwatchbookScreen> {
  String? selectedValue;
  final TextEditingController menuTextEditingController =
      TextEditingController();

  List<ColorShade> colorShades = createColorShades();
  bool filtersApplied = false;
  Set<String> appliedCategories = {};

  @override
  void dispose() {
    menuTextEditingController.dispose();
    super.dispose();
  }

  void _toggleCategory(String category) {
    setState(() {
      if (appliedCategories.contains(category)) {
        appliedCategories.remove(category);
      } else {
        appliedCategories.add(category);
      }
      filtersApplied = appliedCategories.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Swatchbook.',
          style: TextStyle(
            fontSize: screenHeight / 36,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //dropdown search button here
                Flexible(
                  child: DropdownMenu<String>(
                    initialSelection: selectedValue,
                    controller: menuTextEditingController,
                    width: screenWidth * 0.7,
                    label: Text(
                      'Search by shade number',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenHeight / 58,
                      ),
                    ),
                    menuStyle: MenuStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    textStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    menuHeight: 200,
                    requestFocusOnTap: true,
                    enableFilter: true,
                    onSelected: (String? value) {
                      selectedValue = value;
                    },
                    dropdownMenuEntries: colorShades
                        .where((item) =>
                            appliedCategories.isEmpty ||
                            appliedCategories.contains(item.type))
                        .map<DropdownMenuEntry<String>>((ColorShade item) {
                      return DropdownMenuEntry<String>(
                        value: item.shadeValue,
                        label: item.shadeValue,
                      );
                    }).toList(),
                  ),
                ),
                //filter button
                IconButton(
                  onPressed: () {
                    print('filter tapped lmao');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FilterScreen(
                          appliedCategories: appliedCategories,
                          toggleCategory: _toggleCategory,
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    filtersApplied
                        ? Icons.filter_alt
                        : Icons.filter_alt_outlined,
                    color: Colors.white,
                  ),
                  style: IconButton.styleFrom(
                    shape: const CircleBorder(),
                    side: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0),
                itemCount: colorShades
                    .where((shade) =>
                        appliedCategories.isEmpty ||
                        appliedCategories.contains(shade.type))
                    .length,
                itemBuilder: (context, index) {
                  final filteredShades = colorShades
                      .where((shade) =>
                          appliedCategories.isEmpty ||
                          appliedCategories.contains(shade.type))
                      .toList();

                  return GestureDetector(
                    onTap: () {
                      print(filteredShades[index].shadeValue);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(filteredShades[index].imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          color: Colors.black.withOpacity(0.6),
                          child: Text(
                            filteredShades[index].shadeValue,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight / 65,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
