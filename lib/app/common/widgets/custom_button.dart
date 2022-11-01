import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const CustomButton(
      {Key? key, required this.text, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          primary: const Color(0xff4332F7)),
      child: Text(
        text,
        style: TextStyle(
          color:
              color == null ? Colors.white : const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
