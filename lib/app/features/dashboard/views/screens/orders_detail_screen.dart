import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_management/app/common/widgets/custom_button.dart';
import 'package:project_management/app/constans/global_variables.dart';
import 'package:project_management/app/features/dashboard/models/order.dart';
import 'package:project_management/app/features/dashboard/providers/user_provider.dart';
import 'package:project_management/app/utils/services/admin_services.dart';
import 'package:project_management/app/utils/widgets/sidebar/sidebar_orders.dart';
import 'package:provider/provider.dart';

import '../../../../constans/app_constants.dart';
import '../../../../shared_components/responsive_builder.dart';

class OrderDetailScreen extends StatefulWidget {
  static const String routeName = '/order-details';
  final Order order;
  const OrderDetailScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
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
          return Column(children: [
            const SizedBox(height: kSpacing * (kIsWeb ? 1 : 2)),
            OrderDetail(
              order: widget.order,
            ),
          ]);
        },
        tabletBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: (constraints.maxWidth < 950) ? 6 : 9,
                  child: OrderDetail(
                    order: widget.order,
                  )),
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
              Flexible(
                  flex: 9,
                  child: OrderDetail(
                    order: widget.order,
                  )),
            ],
          );
        },
      )),
    );
  }
}

class OrderDetail extends StatefulWidget {
  static const String routeName = '/order-details';
  final Order order;
  const OrderDetail({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  int currentStep = 0;
  final AdminServices adminServices = AdminServices();

  // void navigateToSearchScreen(String query) {
  //   Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  // }

  @override
  void initState() {
    super.initState();
    currentStep = widget.order.status;
  }

  //  !!!ADMIN!!!
  void changeOrderStatus(int status) {
    adminServices.changeOrderStatus(
      context: context,
      status: status + 1,
      order: widget.order,
      onSuccess: () {
        setState(() {
          currentStep += 1;
        });
      },
    );
  }

  final textStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 255, 255, 255));
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return SingleChildScrollView(
      child: Column(
        children: [
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
                          "Orders",
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
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const SizedBox(height: 20),
                    const Text(
                      'View order details',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 500,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order Date:      ${DateFormat().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                widget.order.orderedAt),
                          )}'),
                          Text('Order ID:           ${widget.order.id}'),
                          Text(
                              'Order Total:      Points${widget.order.totalPrice}'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Purchase Details',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < widget.order.products.length; i++)
                            Row(
                              children: [
                                Image.network(
                                  widget.order.products[i].images[0],
                                  height: 120,
                                  width: 120,
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.order.products[i].name,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Qty: ${widget.order.quantity[i]}',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Tracking',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Stepper(
                        currentStep: currentStep,
                        controlsBuilder: (context, details) {
                          if (user.type == 'admin') {
                            return Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: CustomButton(
                                text: 'Done',
                                onTap: () =>
                                    changeOrderStatus(details.currentStep),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                        steps: [
                          Step(
                            title: const Text('Pending'),
                            content: const Text(
                              'Your order is yet to be confirmed',
                            ),
                            isActive: currentStep > 0,
                            state: currentStep > 0
                                ? StepState.complete
                                : StepState.indexed,
                          ),
                          Step(
                            title: const Text('Processed'),
                            content: const Text(
                              'Your order has been processed',
                            ),
                            isActive: currentStep > 1,
                            state: currentStep > 1
                                ? StepState.complete
                                : StepState.indexed,
                          ),
                          Step(
                            title: const Text('Received'),
                            content: const Text(
                              'Your order has been delivered',
                            ),
                            isActive: currentStep > 2,
                            state: currentStep > 2
                                ? StepState.complete
                                : StepState.indexed,
                          ),
                          Step(
                            title: const Text('Delivered'),
                            content: const Text(
                              'Your order has been completed',
                            ),
                            isActive: currentStep >= 3,
                            state: currentStep >= 3
                                ? StepState.complete
                                : StepState.indexed,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
