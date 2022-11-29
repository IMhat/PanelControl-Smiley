import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_management/app/utils/widgets/sidebar/sidebar_analytic.dart';

import '../../../../constans/app_constants.dart';
import '../../../../shared_components/responsive_builder.dart';
import 'calendar/calendart_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);
  static const String routeName = '/analitycs';

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
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
            MyCalendarScreen(),
          ]);
        },
        tabletBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: (constraints.maxWidth < 950) ? 6 : 9,
                  child: const MyCalendarScreen()),
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
              const Flexible(flex: 9, child: MyCalendarScreen()),
            ],
          );
        },
      )),
    );
  }
}

class MyCalendarScreen extends StatefulWidget {
  const MyCalendarScreen({Key? key}) : super(key: key);

  @override
  _MyCalendarScreenState createState() => _MyCalendarScreenState();
}

class _MyCalendarScreenState extends State<MyCalendarScreen> {
  final textStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 255, 255, 255));
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                              "Calendar",
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
                      child: const Text("Check your Schedule",
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
              const SizedBox(height: 30),
              Container(
                width: 900,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      // begin: AlignmentDirectional.,
                      // end: Alignment.bottomCenter,
                      // stops: [
                      //   0.2,
                      //   0.4,
                      //   0.8
                      // ],
                      colors: [
                        (Color(0xffC5CAE9)),
                        Color(0xff9FA8DA),
                        Color(0xff7986CB)
                      ]),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: CalendarWidget(),
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
