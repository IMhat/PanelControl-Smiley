import 'package:flutter/material.dart';
import 'package:project_management/app/features/dashboard/models/order_incoming.dart';

import '../../../../../common/widgets/loader.dart';
import '../../../../../utils/services/admin_services.dart';
import '../../../models/order.dart';
import '../../../models/order_process.dart';
import '../orders_detail_screen.dart';
import '../search_screen.dart';
import '../widget_orders/new_order_card.dart';

class IncomingOrdersScreen extends StatefulWidget {
   
  const IncomingOrdersScreen({Key? key}) : super(key: key);

  @override
  State<IncomingOrdersScreen> createState() => _IncomingOrdersScreenState();
}

class _IncomingOrdersScreenState extends State<IncomingOrdersScreen> {
 List<OrderIncoming>? orders;
  @override
  void initState() {
    super.initState();
    fetchOrderIncoming();
  }

  void fetchOrderIncoming() async {
    orders = await adminServices.fetchAllOrderIncoming(context);
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
                                  color: Color.fromARGB(255, 90, 90, 90)),
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
          border: Border.all(color: Color.fromARGB(255, 59, 59, 59)),
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

BoxDecoration _buildBoxDecoration1() => const BoxDecoration(
    color: Color(0xff48409E),
    gradient: LinearGradient(colors: <Color>[
      (Color(0xff48409E)),
      (Color(0xff4332F7)),
    ]),
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(15),
        bottomLeft: Radius.circular(15),
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15)));
