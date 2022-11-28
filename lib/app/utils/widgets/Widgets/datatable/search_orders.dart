import 'package:flutter/material.dart';


import '../../../../features/dashboard/models/order.dart';

class SearchedOrders extends StatelessWidget {
  final Order orders;
  final String userId;
  final String name;
  final String id;
  const SearchedOrders(
      {Key? key, required this.orders, required this.name, required this.userId, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Wrap(
            children: [
             SizedBox(width: 100, height: 40, child: Text(userId),),
              Column(
                children: [
                   Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      id,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
