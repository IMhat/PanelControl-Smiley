// ignore: depend_on_referenced_packages

// ignore: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:project_management/app/common/widgets/loader.dart';
import 'package:project_management/app/features/dashboard/models/order.dart';
import 'package:project_management/app/features/dashboard/views/screens/orders_detail_screen.dart';
import 'package:project_management/app/utils/services/admin_services.dart';
import 'package:project_management/app/utils/widgets/single_product.dart';

class OrdersScreen extends StatefulWidget {
  static const String route = '/getOrders';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : Padding(
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: GridView.builder(
              itemCount: orders!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final orderData = orders![index];
                return GestureDetector(
                  // onTap: () {
                  //   Navigator.pushNamed(
                  //     context,
                  //     OrderDetailScreen.route,
                  //     arguments: orderData,
                  //   );
                  // },

                  onTap: () {
                    Navigator.of(context).pushNamed(OrderDetailScreen.route);
                  },

                  child: SizedBox(
                    height: 140,
                    child: SingleProduct(
                      image: orderData.products[0].images[0],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
