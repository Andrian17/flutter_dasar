import 'package:flutter/material.dart';

class ButtonMenu extends StatefulWidget {
  const ButtonMenu({Key? key}) : super(key: key);

  @override
  _ButtonMenu createState() => _ButtonMenu();
}

class _ButtonMenu extends State<ButtonMenu> {
  late List<bool> isSelected = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      onPressed: (int index) {
        setState(() {
          for (int buttonIndex = 0;
              buttonIndex < isSelected.length;
              buttonIndex++) {
            if (buttonIndex == index) {
              isSelected[buttonIndex] = true;
            } else {
              isSelected[buttonIndex] = false;
            }
          }
        });
      },
      isSelected: isSelected,
      children: const <Widget>[
        Icon(Icons.format_bold),
        Icon(Icons.format_italic),
        Icon(Icons.format_underlined),
      ],
    );
  }
}
