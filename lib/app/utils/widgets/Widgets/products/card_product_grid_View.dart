import 'package:flutter/material.dart';

class CardProductGrid extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  const CardProductGrid(
      {Key? key, required this.image, required this.name, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 250,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 184, 184, 184)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Image.network(
            image,
            fit: BoxFit.fitHeight,
            width: 300,
            height: 100,
          ),
          const Divider(indent: 2, color: Color.fromARGB(255, 170, 169, 169)),
          Center(
            child: SizedBox(
              width: 200,
              height: 80,
              child: Text(
                name,
                style: const TextStyle(fontSize: 15),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Wrap(
            children: [
              Text(
                price.toString(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 10),
              const Text(
                "Puntos",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ],
      ),
    );
  }
}
