import 'package:flutter/material.dart';

class ButtonCheck extends StatelessWidget {
  const ButtonCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyButtonCheck();
  }
}

class MyButtonCheck extends StatelessWidget {
  const MyButtonCheck();

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        Navigator.pushNamed(
          context,
          '',
        );
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(7.0),
        width: 90,
        height: 35,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.2,
                0.4,
                0.8
              ],
              colors: [
                (Color(0xff7F00F0)),
                Color.fromARGB(255, 165, 92, 179),
                Color.fromARGB(255, 247, 90, 98)
              ]),
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: const Text(
          'Check',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
