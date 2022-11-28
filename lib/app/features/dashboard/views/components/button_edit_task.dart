import 'package:flutter/material.dart';
import 'package:project_management/app/features/dashboard/views/components/theme.dart';

class MyButtonEditTask extends StatelessWidget {
  final Function onTap;
  final String label;

   const MyButtonEditTask({Key? key, 
    required this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 50,
        width: 130,
        decoration: BoxDecoration(
          color: primaryClr,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff48409E),
            // gradient: const LinearGradient(
            //     begin: AlignmentDirectional.topCenter,
            //     end: Alignment.bottomCenter,
            //     stops: [
            //       0.2,
            //       0.4,
            //       0.8
            //     ],
            //     colors: [
            //       (Color(0xff7F00F0)),
            //       Color.fromARGB(255, 165, 92, 179),
            //       Color.fromARGB(255, 247, 90, 98)
            //     ]),
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
