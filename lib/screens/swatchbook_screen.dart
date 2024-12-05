import 'package:flutter/material.dart';
import 'package:freelance_hair_colorplus/models/custom_hair_profile.dart';

class SwatchbookScreen extends StatefulWidget {
  const SwatchbookScreen({super.key});

  @override
  State<SwatchbookScreen> createState() => _SwatchbookScreenState();
}

class _SwatchbookScreenState extends State<SwatchbookScreen> {
  String? selectedValue;
  final TextEditingController menuTextEditingController =
      TextEditingController();

  List<String> shadeList = shades;

  @override
  void dispose() {
    menuTextEditingController.dispose();
    super.dispose();
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
                    dropdownMenuEntries:
                        shadeList.map<DropdownMenuEntry<String>>((String item) {
                      return DropdownMenuEntry<String>(
                        value: item,
                        label: item,
                      );
                    }).toList(),
                  ),
                ),
                //filter button
                IconButton(
                  onPressed: () {
                    print('filter tapped');
                  },
                  icon: const Icon(
                    Icons.filter_alt_outlined,
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
                itemCount: shadeList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //to add
                      print(shadeList[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/shadecolor_pngs/color_${shadeList[index]}.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          color: Colors.black.withOpacity(0.6),
                          child: Text(
                            shadeList[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight / 65,
                                fontWeight: FontWeight.w500),
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
