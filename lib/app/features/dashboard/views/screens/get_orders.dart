// ignore: depend_on_referenced_packages

// ignore: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_management/app/common/widgets/loader.dart';
import 'package:project_management/app/features/dashboard/models/order.dart';
import 'package:project_management/app/features/dashboard/views/screens/calendar/calendart_widget.dart';
import 'package:project_management/app/features/dashboard/views/screens/calendar/colors_calendar.dart';
import 'package:project_management/app/features/dashboard/views/screens/orders_detail_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/search_screen.dart';
import 'package:project_management/app/utils/services/admin_services.dart';
import 'package:project_management/app/utils/widgets/Widgets/dattable_orders.dart';
import 'package:project_management/app/utils/widgets/sidebar/sidebar_orders.dart';
import 'package:project_management/app/utils/widgets/single_order.dart';
import 'package:project_management/app/utils/widgets/Widgets/products/single_product.dart';
import 'package:project_management/app/utils/widgets/task_bar2.dart';

import '../../../../constans/app_constants.dart';
import '../../../../shared_components/responsive_builder.dart';

class OrdersScreen extends StatefulWidget {
  static const String routeName = '/getOrders';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: controller.scaffoldKey,
      drawer: (ResponsiveBuilder.isDesktop(context))
          ? null
          : const Drawer(
              child: Padding(
                padding: EdgeInsets.only(top: kSpacing),
                child: SidebarOrders(),
              ),
            ),
      appBar: AppBar(backgroundColor: const Color(0xff48409E)),
      body: SingleChildScrollView(
          child: ResponsiveBuilder(
        mobileBuilder: (context, constraints) {
          return Column(children: const [
            SizedBox(height: kSpacing * (kIsWeb ? 1 : 2)),
            MyOrders(),
          ]);
        },
        tabletBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: (constraints.maxWidth < 950) ? 6 : 9,
                  child: const MyOrders()),
              //const Flexible(flex: 4, child: TaskResponsive())
            ],
          );
        },
        desktopBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SidebarHomeTask(),
              Flexible(
                flex: (constraints.maxWidth < 1360) ? 4 : 3,
                child: const ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(kBorderRadius),
                      bottomRight: Radius.circular(kBorderRadius),
                    ),
                    child: SidebarOrders()),
              ),
              const Flexible(flex: 9, child: MyOrders()),
            ],
          );
        },
      )),
    );
  }
}

class MyOrders extends StatefulWidget {
  const MyOrders();

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List<Order>? orders;
  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await adminServices.fetchAllOrders(context);
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
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(right: 40),
                      width: 1450,
                      height: 80,
                      decoration: _buildBoxDecoration1(),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20, top: 20),
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(children: [
                                  Text(
                                    "Ordenes",
                                    style: textStyle,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "Uteam",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            margin: const EdgeInsets.all(25),
                            height: 30,
                            width: 200,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 42,
                                      margin: const EdgeInsets.only(left: 15),
                                      child: Material(
                                        borderRadius: BorderRadius.circular(7),
                                        elevation: 1,
                                        child: TextFormField(
                                          onFieldSubmitted:
                                              navigateToSearchScreen,
                                          decoration: InputDecoration(
                                            prefixIcon: InkWell(
                                              onTap: () {},
                                              child: const Padding(
                                                padding: EdgeInsets.only(
                                                  left: 6,
                                                ),
                                                child: Icon(
                                                  Icons.search,
                                                  color: Colors.black,
                                                  size: 23,
                                                ),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding:
                                                const EdgeInsets.only(top: 10),
                                            border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(7),
                                              ),
                                              borderSide: BorderSide.none,
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(7),
                                              ),
                                              borderSide: BorderSide(
                                                color: Colors.black38,
                                                width: 1,
                                              ),
                                            ),
                                            hintText: 'Search Catalog',
                                            hintStyle: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.transparent,
                                    height: 42,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: const Icon(Icons.mic,
                                        color: Colors.black, size: 25),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Wrap(
                      children: [
                        Container(
                          width: 1600,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                width: 140,
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
                        ),
                        Container(
                          width: currentWidth,
                          height: 900,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 0, 0, 0)),
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

                                  child: SingleOrder(
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
