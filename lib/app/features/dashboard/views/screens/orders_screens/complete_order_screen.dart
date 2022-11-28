import 'package:flutter/material.dart';

import '../../../../../common/widgets/loader.dart';
import '../../../../../utils/services/admin_services.dart';
import '../../../models/order_complete.dart';
import '../orders_detail_screen.dart';
import '../search_screen.dart';
import '../widget_orders/new_order_card.dart';

class OrderCompleteScreen extends StatefulWidget {
   
  const OrderCompleteScreen({Key? key}) : super(key: key);

  @override
  State<OrderCompleteScreen> createState() => _OrderCompleteScreenState();
}

class _OrderCompleteScreenState extends State<OrderCompleteScreen> {
 List<OrderComplete>? orders;
  @override
  void initState() {
    super.initState();
    fetchOrderComplete();
  }

  void fetchOrderComplete() async {
    orders = await adminServices.fetchAllOrderComplete(context);
    setState(() {});
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  final textStyleTitle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Color.fromARGB(255, 0, 0, 0));
  final AdminServices adminServices = AdminServices();
  final textStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 255, 255, 255));
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    // The GestureDetector wraps the button.
    return orders == null
        ? const Loader()
        : SingleChildScrollView(
            child: Wrap(
              children: [
                Column(
                  children: [
                  
                   
                    const SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      children: [
                        headerOrders(),
                        Container(
                          width: currentWidth,
                          height: 900,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 90, 90, 90)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView.builder(
                              itemCount: orders!.length,
                              //gridDelegate:
                              // const SliverGridDelegateWithFixedCrossAxisCount(
                              //crossAxisCount: 1),
                              itemBuilder: (context, index) {
                                final orderData = orders![index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      OrderDetailScreen.routeName,
                                      arguments: orderData,
                                    );
                                  },

                                  // onTap: () {
                                  //   Navigator.of(context)
                                  //       .pushNamed(OrderDetailScreen.routeName);
                                  // },

                                  child: NewOrderCard(
                                    id: orderData.id,
                                    name: orderData.products[0].name,
                                    totalPrice: orderData.totalPrice.toString(),
                                    quantity: orderData.quantity.toString(),
                                    userId: orderData.userId.toString(),
                                    status: orderData.status,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  Container headerOrders() {
    return Container(
      width: 1600,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 59, 59, 59)),
          borderRadius: BorderRadius.circular(10)),
      child: Wrap(
        children: [
          const SizedBox(
            width: 180,
          ),
          Text(
            "Id",
            style: textStyleTitle,
          ),
          const SizedBox(
            width: 220,
          ),
          Text("Products", style: textStyleTitle),
          const SizedBox(
            width: 160,
          ),
          Text("Points", style: textStyleTitle),
          const SizedBox(
            width: 110,
          ),
          Text("Status", style: textStyleTitle),
          const SizedBox(
            width: 180,
          ),
          Text("User Id", style: textStyleTitle),
          const SizedBox(
            width: 180,
          ),
          Text("Amount", style: textStyleTitle),
        ],
      ),
    );
  }
}


