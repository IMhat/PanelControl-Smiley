import 'package:flutter/material.dart';

class DropdownItem extends StatefulWidget {
  const DropdownItem({Key? key}) : super(key: key);

  @override
  State<DropdownItem> createState() => _DropdownItemState();
}

class _DropdownItemState extends State<DropdownItem> {
  String selectedValue = "USA";

  get dropdownItems => null;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      items: dropdownItems,
      onChanged: (String? value) {},
    );
  }
}
