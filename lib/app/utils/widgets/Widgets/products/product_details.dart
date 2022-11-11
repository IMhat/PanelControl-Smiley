// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../../../../constans/app_constants.dart';
// import '../../../../features/dashboard/models/product.dart';
// import '../../../../shared_components/responsive_builder.dart';
// import '../../../services/admin_services.dart';
// import '../../sidebar/sidebar_products.dart';

// class ProductDetails extends StatefulWidget {
//   static const String routeName = '/ProductDetails';
//   const ProductDetails({Key? key}) : super(key: key);

//   @override
//   State<ProductDetails> createState() => _ProductDetailsState();
// }

// class _ProductDetailsState extends State<ProductDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // key: controller.scaffoldKey,
//       drawer: (ResponsiveBuilder.isDesktop(context))
//           ? null
//           : const Drawer(
//               child: Padding(
//                 padding: EdgeInsets.only(top: kSpacing),
//                 child: SidebarProducts(),
//               ),
//             ),
//       appBar: AppBar(backgroundColor: const Color(0xff48409E)),
//       body: SingleChildScrollView(
//           child: ResponsiveBuilder(
//         mobileBuilder: (context, constraints) {
//           return Column(children: [
//             SizedBox(height: kSpacing * (kIsWeb ? 1 : 2)),
//             MyProductsDetails(),
//           ]);
//         },
//         tabletBuilder: (context, constraints) {
//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Flexible(
//                   flex: (constraints.maxWidth < 950) ? 6 : 9,
//                   child: MyProductsDetails()),
//               //const Flexible(flex: 4, child: TaskResponsive())
//             ],
//           );
//         },
//         desktopBuilder: (context, constraints) {
//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // const SidebarHomeTask(),
//               Flexible(
//                 flex: (constraints.maxWidth < 1360) ? 4 : 3,
//                 child: const ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(kBorderRadius),
//                       bottomRight: Radius.circular(kBorderRadius),
//                     ),
//                     child: SidebarProducts()),
//               ),
//               Flexible(
//                 flex: 9,
//                 child: MyProductsDetails(),
//               ),
//             ],
//           );
//         },
//       )),
//     );
//   }
// }

// class MyProductsDetails extends StatefulWidget {
//   const MyProductsDetails({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MyProductsDetails> createState() => _MyProductsDetailsState();
// }

// class _MyProductsDetailsState extends State<MyProductsDetails> {
//   List<Product>? products;
//   final AdminServices adminServices = AdminServices();

//   final textStyle = const TextStyle(
//       fontSize: 20,
//       fontWeight: FontWeight.w400,
//       color: Color.fromARGB(255, 255, 255, 255));

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         child: Column(children: [
//       const SizedBox(height: 20),
//       Wrap(
//         children: [
//           Container(
//             margin: const EdgeInsets.only(right: 40),
//             width: 1450,
//             height: 80,
//             decoration: _buildBoxDecoration1(),
//             child: Wrap(
//               alignment: WrapAlignment.spaceAround,
//               children: [
//                 // Container(
//                 //   margin: const EdgeInsets.only(left: 20, top: 10),
//                 //   width: 250,
//                 //   child: Column(
//                 //     crossAxisAlignment: CrossAxisAlignment.start,
//                 //     children: [
//                 //       Wrap(children: [
//                 //         Text(
//                 //           "Productos",
//                 //           style: textStyle,
//                 //         ),
//                 //         const SizedBox(
//                 //           width: 10,
//                 //         ),
//                 //         const Text(
//                 //           "Uteam",
//                 //           style: TextStyle(
//                 //               color: Colors.white,
//                 //               fontWeight: FontWeight.w600,
//                 //               fontSize: 20),
//                 //         ),
//                 //       ]),
//                 //     ],
//                 //   ),
//                 // ),

//                 Container(
//                   margin: const EdgeInsets.all(25),
//                   width: 350,
//                   height: 50,
//                   child: const Text("Product Detail",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 20)),
//                 ),

//                 // const SizedBox(width: 20),
//                 // Container(
//                 //     child: SearchScreen(
//                 //   searchQuery: PostsScreen.routeName,
//                 // )),
//               ],
//             ),
//           ),
//         ],
//       ),
//       Container(
//         child: Text("productorders"),
//       )
//     ]));
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
