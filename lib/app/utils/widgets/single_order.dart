import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleOrder extends StatelessWidget {
  final String image;
  final String name;
  final String totalPrice;
  final String quantity;

  final String userId;
  const SingleOrder(
      {Key? key,
      required this.image,
      required this.name,
      required this.totalPrice,
      required this.quantity,
      required this.userId})
      : super(key: key);
  final textStyleTitle = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey);
  final textStyle = const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 213, 213, 213),
      padding: const EdgeInsets.only(top: 1),
      child: Container(
        width: 300,
        height: 100,
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
          alignment: WrapAlignment.spaceAround,
          children: [
            Image.network(
              image,
              fit: BoxFit.fitHeight,
              width: 60,
            ),
            Column(
              children: [
                Text(
                  name,
                  style: textStyle,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Id",
                  style: textStyleTitle,
                ),
                const SizedBox(height: 10),
                Text(
                  userId,
                  style: textStyle,
                ),
              ],
            ),
            Column(
              children: [
                Text("Puntos", style: textStyleTitle),
                const SizedBox(height: 10),
                Text(
                  totalPrice,
                  style: textStyle,
                ),
              ],
            ),
            Column(
              children: [
                Text("Cantidad", style: textStyleTitle),
                const SizedBox(height: 10),
                Text(
                  quantity,
                  style: textStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
