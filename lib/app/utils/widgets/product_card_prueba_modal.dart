import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductModalPrueba extends StatelessWidget {
  final String image;
  const ProductModalPrueba({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: const Color.fromARGB(255, 199, 197, 197),
      ),
      padding: const EdgeInsets.all(10),
      child: CircleAvatar(
        radius: 25.0,
        child: Image.network(
          image,
          fit: BoxFit.fitHeight,
          width: 40,
        ),
      ),
    );
  }
}


  //  Container(
  //       width: 150,
  //       color: Colors.red,
  //       height: 60,
  //       padding: const EdgeInsets.all(10),
  //       child: Image.network(
  //         image,
  //         fit: BoxFit.fitHeight,
  //         width: 40,
  //       ),
  //     ),