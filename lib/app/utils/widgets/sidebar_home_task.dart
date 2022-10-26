import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:project_management/app/features/auth/services/auth_service.dart';
import 'package:project_management/app/features/auth/widgets/account_button.dart';
import 'package:project_management/app/features/dashboard/views/screens/analytics_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/get_orders.dart';
import 'package:project_management/app/features/dashboard/views/screens/products_screen.dart';

import '../../features/dashboard/views/screens/tasks_screen.dart';
import '../../shared_components/today_text.dart';

class SidebarHomeTask extends StatelessWidget {
  const SidebarHomeTask({Key? key}) : super(key: key);
  final decoration = const BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)));
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        const Text(
          "SMILEY",
          style: TextStyle(
              fontSize: 30,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Color(0xff48409E)),
        ),
        const TodayText(),
        Container(
          margin: const EdgeInsets.only(right: 150, top: 25),
          child: const Text(
            "Menú",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(TasksScreen.routeName);
            },
            child: Container(
              decoration: decoration,
              width: 200,
              height: 50,
              child: Row(
                children: const [
                  Icon(
                    Icons.menu_book,
                    color: Color(0xff48409E),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Task Board",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Color(0xff48409E)),
                  ),
                ],
              ),
            )),
        // OutlinedButton.icon(
        //   icon: const Icon(Icons.inbox_rounded,
        //       color: Color.fromARGB(255, 0, 130, 153)),
        //   label: const Text(
        //     "Inbox",
        //   ),
        //   style: outlineButtonStyle,
        //   onPressed: () {
        //     // Navigate to the overview page using a named route.
        //     //Navigator.of(context).pushNamed(TasksScreen.route);
        //   },
        // ),
        const SizedBox(height: 10),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(OrdersScreen.routeName);
            },
            child: Container(
              decoration: decoration,
              width: 200,
              height: 50,
              child: Row(
                children: const [
                  Icon(
                    Icons.list_alt_sharp,
                    color: Color(0xff48409E),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "List Orders",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Color(0xff48409E)),
                  ),
                ],
              ),
            )),

        const SizedBox(height: 10),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(PostsScreen.routeName);
            },
            child: Container(
              decoration: decoration,
              width: 200,
              height: 50,
              child: Row(
                children: const [
                  Icon(
                    Icons.list,
                    color: Color(0xff48409E),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Products",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Color(0xff48409E)),
                  ),
                ],
              ),
            )),

        const SizedBox(height: 10),
        TextButton(
            onPressed: () {},
            child: Container(
              decoration: decoration,
              width: 200,
              height: 50,
              child: Row(
                children: const [
                  Icon(
                    Icons.today,
                    color: Color(0xff48409E),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Calendar",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Color(0xff48409E)),
                  ),
                ],
              ),
            )),
        const SizedBox(height: 10),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AnalyticsScreen.routeName);
            },
            child: Container(
              decoration: decoration,
              width: 200,
              height: 50,
              child: Row(
                children: const [
                  Icon(
                    Icons.drag_indicator_sharp,
                    color: Color(0xff48409E),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Analitycs",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Color(0xff48409E)),
                  ),
                ],
              ),
            )),

        const SizedBox(height: 10),
        TextButton(
            onPressed: () {},
            child: Container(
              decoration: decoration,
              width: 200,
              height: 50,
              child: Row(
                children: const [
                  Icon(
                    Icons.book,
                    color: Color(0xff48409E),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Forms",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Color(0xff48409E)),
                  ),
                ],
              ),
            )),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(top: 80),
          width: 250,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Comunication",
                style: TextStyle(
                    color: Color.fromARGB(255, 143, 143, 143), fontSize: 15),
              ),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {},
                  child: Container(
                    decoration: decoration,
                    width: 200,
                    height: 50,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.chat,
                          color: Color(0xffC4C4C4),
                        ),
                        SizedBox(width: 15),
                        Text(
                          "Chat",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color(0xffC4C4C4)),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(top: 0, bottom: 20),
                //decoration: _cardBorders(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AccountButton(
                      text: 'Log Out',
                      onTap: () => AuthService().logOut(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[850]!.withOpacity(0.29),
            offset: const Offset(-10, 15),
            blurRadius: 10,
          )
        ]);
