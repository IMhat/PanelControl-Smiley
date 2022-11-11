import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/loader.dart';
import '../../../../features/dashboard/models/sales.dart';
import '../../../services/admin_services.dart';
import '../../category_product_chart.dart';

class AnalyticsHome extends StatefulWidget {
  const AnalyticsHome({Key? key}) : super(key: key);

  @override
  _AnalyticsHomeState createState() => _AnalyticsHomeState();
}

class _AnalyticsHomeState extends State<AnalyticsHome> {
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
            child: Container(
              width: 1000,
              height: 700,
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
