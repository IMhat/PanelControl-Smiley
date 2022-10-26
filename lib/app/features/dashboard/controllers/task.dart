import 'package:project_management/app/common/widgets/loader.dart';
import 'package:project_management/app/features/dashboard/models/tasks.dart';
import 'package:project_management/app/features/dashboard/views/screens/add_task_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/task_detail_screen.dart';
import 'package:project_management/app/utils/services/admin_services.dart';
import 'package:project_management/app/utils/widgets/single_task.dart';

// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  // temporary list
  List<Task>? tasks;

  final AdminServices accountServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchWallet();
  }

  void fetchWallet() async {
    tasks = await accountServices.fetchAllBacklogTask(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return tasks == null
        ? const Loader()
        : Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       padding: const EdgeInsets.only(left: 15),
              //       child: const Text(
              //         'Your Wallet',
              //         style: TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     ),
              //     // Container(
              //     //   padding: const EdgeInsets.only(right: 15),
              //     //   child: Text(
              //     //     'See all',
              //     //     style: TextStyle(
              //     //       color: GlobalVariables.selectedNavBarColor,
              //     //     ),
              //     //   ),
              //     // ),
              //   ],
              // ),

              // DISPLAY ORDERS
              Container(
                margin: EdgeInsets.only(right: 20),
                width: 275,
                height: 680,
                decoration: const BoxDecoration(
                  color: Color(0xffBFB9FF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: tasks!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          TaskDetailsScreen.routeName,
                          arguments: tasks![index],
                        );
                      },
                      child: SingleTask(
                        task: tasks![index],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
