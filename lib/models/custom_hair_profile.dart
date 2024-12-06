class ColorShade {
  final String type;
  final String shadeValue;
  final String imagePath;

  ColorShade(
      {required this.type, required this.shadeValue, required this.imagePath});
}

enum ColorGroup {
  ash,
  violet,
  golden,
  copper,
  mahogany,
  red,
  chocolate,
  green,
}

Map<String, List<String>> colorType = {
  'Naturals': [
    '1.00',
    '3.00',
    '4.00',
    '5.00',
    '6.00',
    '7.00',
    '8.00',
    '9.00',
    '10.00'
  ],
  'Cool Naturals': ['5.08', '7.08'],
  'Warm Brown': ['5.70', '5.77', '6.37', '7.71'],
  'Goldens': ['5.30', '6.30', '7.30', '8.30', '9.30'],
  'Mahogany Red': ['4.65', '4.65_1', '5.65', '5.56'],
  'Mahogany': ['4.50', '5.50'],
  'Golden Mahogany': ['5.35'],
  'Intense Red': ['5.66', '6.66'],
  'Violet': ['4.22', '5.22', '6.4', '7.4'],
  'Copper Golden': ['7.34', '8.34'],
  'Ash': ['7.10', '8.10', '9.10'],
  'Intense Ash': ['6.11', '7.11', '8.11', '9.11'],
  'Cold Brown': ['6.87', '8.71'],
  'Toners': ['9.08', '9.09', '10.89'],
  'Super Lightner': ['11.90', '11.10', '11.89', '11.21'],
  'Booster': ['0.99', '0.66', '0.33', '0.28', '0.25', 'green_booster'],
};

final List<String> shades = [
  '0.25',
  '0.28',
  '0.33',
  '0.66',
  '0.99',
  '1.00',
  '10.00',
  '10.89',
  '11.10',
  '11.21',
  '11.80',
  '11.89',
  '3.00',
  '4.00',
  '4.22',
  '4.50',
  '4.65',
  '4.65_1',
  '5.00',
  '5.08',
  '5.22',
  '5.30',
  '5.35',
  '5.50',
  '5.56',
  '5.66',
  '5.70',
  '5.77',
  '6.00',
  '6.11',
  '6.30',
  '6.37',
  '6.40',
  '6.66',
  '6.87',
  '7.00',
  '7.08',
  '7.10',
  '7.11',
  '7.30',
  '7.34',
  '7.40',
  '7.71',
  '8.00',
  '8.10',
  '8.11',
  '8.30',
  '8.34',
  '8.71',
  '9.00',
  '9.08',
  '9.09',
  '9.10',
  '9.11',
  '9.30',
  'green_booster'
];

List<ColorShade> createColorShades() {
  List<ColorShade> colorShades = [];
  colorType.forEach((type, shadesList) {
    for (String shadeValue in shadesList) {
      String imagePath = 'assets/images/shadecolor_pngs/color_$shadeValue.png';
      colorShades.add(
        ColorShade(
          type: type,
          shadeValue: shadeValue,
          imagePath: imagePath,
        ),
      );
    }
  });
  return colorShades;
}
