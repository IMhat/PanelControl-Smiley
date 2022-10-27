import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_management/app/utils/widgets/sidebar/sidebar_analytic.dart';

import '../../../../common/widgets/loader.dart';
import '../../../../constans/app_constants.dart';
import '../../../../shared_components/responsive_builder.dart';
import '../../../../utils/services/admin_services.dart';
import '../../../../utils/widgets/category_product_chart.dart';
import '../../models/sales.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);
  static const String routeName = '/analitycs';

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: controller.scaffoldKey,
      drawer: (ResponsiveBuilder.isDesktop(context))
          ? null
          : const Drawer(
              child: Padding(
                padding: EdgeInsets.only(top: kSpacing),
                child: SidebarAnalytic(),
              ),
            ),
      appBar: AppBar(backgroundColor: const Color(0xff48409E)),
      body: SingleChildScrollView(
          child: ResponsiveBuilder(
        mobileBuilder: (context, constraints) {
          return Column(children: const [
            SizedBox(height: kSpacing * (kIsWeb ? 1 : 2)),
            MyAnalyticsScreen(),
          ]);
        },
        tabletBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: (constraints.maxWidth < 950) ? 6 : 9,
                  child: const MyAnalyticsScreen()),
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
                    child: SidebarAnalytic()),
              ),
              const Flexible(flex: 9, child: MyAnalyticsScreen()),
            ],
          );
        },
      )),
    );
  }
}

class MyAnalyticsScreen extends StatefulWidget {
  const MyAnalyticsScreen({Key? key}) : super(key: key);

  @override
  _MyAnalyticsScreenState createState() => _MyAnalyticsScreenState();
}

class _MyAnalyticsScreenState extends State<MyAnalyticsScreen> {
  final AdminServices adminServices = AdminServices();

  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  final textStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 255, 255, 255));
  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
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
                      child: Wrap(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20, top: 10),
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(children: const [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
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
                          const SizedBox(width: 150),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: const Text("Monitoriza los puntos canjeados",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20)),
                          ),
                          const SizedBox(width: 20),
                          // Container(
                          //   child: const CircleAvatar(
                          //     radius: 25.0,
                          //     backgroundColor:
                          //         Color.fromARGB(255, 211, 211, 211),
                          //     backgroundImage: AssetImage(
                          //         'assets/images/raster/avatar-1.png'),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1000,
                      height: 800,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Text(
                              'Total Exchange Points:  $totalSales',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Container(
                              color: Colors.black12.withOpacity(0.08),
                              height: 1,
                            ),
                            const SizedBox(height: 40),
                            Container(
                              height: 500,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black12,
                                ),
                              ),
                              child: CategoryProductsChart(seriesList: [
                                charts.Series(
                                  id: 'Sales',
                                  data: earnings!,
                                  domainFn: (Sales sales, _) => sales.label,
                                  measureFn: (Sales sales, _) => sales.earning,
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
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
