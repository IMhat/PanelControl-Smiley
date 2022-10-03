import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 0, 130, 153), width: 2)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        labelText: labelText,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.deepPurple)
            : null);
  }
}
