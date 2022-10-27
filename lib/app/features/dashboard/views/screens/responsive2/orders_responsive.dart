// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../../../../../common/widgets/loader.dart';
// import '../../../../../utils/services/admin_services.dart';
// import '../../../../../utils/widgets/sidebar/sidebar_orders.dart';
// import '../../../../../utils/widgets/single_order.dart';
// import '../../../models/order.dart';
// import '../orders_detail_screen.dart';

// class OrdersRespons extends StatelessWidget {
//   const OrdersRespons({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const OrdersResponsive();
//   }
// }

// class OrdersResponsive extends StatefulWidget {
//   const OrdersResponsive({Key? key}) : super(key: key);

//   @override
//   State<OrdersResponsive> createState() => _OrdersResponsiveState();
// }

// class _OrdersResponsiveState extends State<OrdersResponsive> {
//   List<Order>? orders;
//   final AdminServices adminServices = AdminServices();

//   @override
//   void initState() {
//     super.initState();
//     fetchOrders();
//   }

//   void fetchOrders() async {
//     orders = await adminServices.fetchAllOrders(context);
//     setState(() {});
//   }

//   final textStyle = const TextStyle(
//       fontSize: 20,
//       fontWeight: FontWeight.w400,
//       color: Color.fromARGB(255, 255, 255, 255));
//   @override
//   Widget build(BuildContext context) {
//     return orders == null
//         ? const Loader()
//         : Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               backgroundColor: const Color(0xff48409E),
//             ),
//             body: SingleChildScrollView(
//               child: Wrap(
//                 children: [
//                   const SidebarOrders(),
//                   Column(
//                     children: [
//                       const SizedBox(height: 20),
//                       Container(
//                         margin: const EdgeInsets.only(right: 40),
//                         width: 1450,
//                         height: 80,
//                         decoration: _buildBoxDecoration1(),
//                         child: Row(
//                           children: [
//                             Container(
//                               margin: const EdgeInsets.only(left: 20, top: 20),
//                               width: 250,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Wrap(children: [
//                                     Text(
//                                       "Ordenes",
//                                       style: textStyle,
//                                     ),
//                                     const SizedBox(
//                                       width: 10,
//                                     ),
//                                     const Text(
//                                       "Uteam",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 20),
//                                     ),
//                                   ]),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(width: 200),
//                             Container(
//                               child: const CircleAvatar(
//                                 radius: 25.0,
//                                 backgroundColor:
//                                     Color.fromARGB(255, 211, 211, 211),
//                                 backgroundImage: AssetImage(
//                                     'assets/images/raster/avatar-1.png'),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Wrap(
//                         children: [
//                           Container(
//                             width: 1000,
//                             height: 900,
//                             child: Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: ListView.builder(
//                                 itemCount: orders!.length,
//                                 //gridDelegate:
//                                 // const SliverGridDelegateWithFixedCrossAxisCount(
//                                 //crossAxisCount: 1),
//                                 itemBuilder: (context, index) {
//                                   final orderData = orders![index];
//                                   return GestureDetector(
//                                     onTap: () {
//                                       Navigator.pushNamed(
//                                         context,
//                                         OrderDetailScreen.routeName,
//                                         arguments: orderData,
//                                       );
//                                     },

//                                     // onTap: () {
//                                     //   Navigator.of(context)
//                                     //       .pushNamed(OrderDetailScreen.routeName);
//                                     // },

//                                     child: SingleOrder(
//                                       image: orderData.products[0].images[0],
//                                       name: orderData.products[0].name,
//                                       totalPrice:
//                                           orderData.totalPrice.toString(),
//                                       quantity: orderData.quantity.toString(),
//                                       userId: orderData.userId.toString(),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//   }
// }

// BoxDecoration _buildBoxDecoration1() => const BoxDecoration(
//     color: Color(0xff48409E),
//     gradient: LinearGradient(colors: <Color>[
//       (Color(0xff48409E)),
//       (Color(0xff4332F7)),
//     ]),
//     borderRadius: BorderRadius.only(
//         bottomRight: Radius.circular(15),
//         bottomLeft: Radius.circular(15),
//         topLeft: Radius.circular(15),
//         topRight: Radius.circular(15)));
