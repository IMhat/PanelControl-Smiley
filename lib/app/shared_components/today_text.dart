import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayText extends StatelessWidget {
  const TodayText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Today", style: TextStyle(color: Colors.black)),
          Text(
            DateFormat.yMMMEd().format(DateTime.now()),
            style: const TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
