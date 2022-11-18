import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  const SingleProduct(
      {Key? key, required this.image, required this.name, required this.price})
      : super(key: key);

  final textStyleTitle = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey);

  final textStyle = const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    // final currentWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(left: 75),
      color: const Color.fromARGB(255, 213, 213, 213),
      child: Container(
        width: 800,
        height: 60,
        color: Colors.white,
        // decoration: BoxDecoration(
        //     color: Color.fromARGB(255, 186, 185, 186),
        //     borderRadius: const BorderRadius.all(Radius.circular(8)),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.grey[850]!.withOpacity(0.29),
        //         offset: const Offset(-10, 10),
        //         blurRadius: 10,
        //       )
        //     ]),
        padding: const EdgeInsets.all(10),
        child: Wrap(
          //alignment: WrapAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: Image.network(image),
                )
              ],
            ),
            const SizedBox(
              width: 150,
            ),
            Column(
              children: [
                SizedBox(
                  width: 150,
                  height: 60,
                  child: Text(
                    name,
                    style: textStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 150,
            ),
            // Column(
            //   children: [
            //     Text(
            //       "Id",
            //       style: textStyleTitle,
            //     ),
            //     const SizedBox(height: 10),
            //     Text(
            //       userId,
            //       style: textStyle,
            //     ),
            //   ],
            // ),
            Column(
              children: [
                Text("Points", style: textStyleTitle),
                const SizedBox(height: 10),
                Text(
                  price.toString(),
                  style: textStyle,
                ),
              ],
            ),
            // Column(
            //   children: [
            //     Text("Status", style: textStyleTitle),
            //     const SizedBox(height: 10),
            //     Text(
            //       widget.status.toString(),
            //       style: textStyle,
            //     ),
            //   ],
            // ),
            // Column(
            //   children: [
            //     Text("User ID", style: textStyleTitle),
            //     const SizedBox(height: 10),
            //     Text(
            //       widget.userId,
            //       style: textStyle,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
