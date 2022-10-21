import 'package:project_management/app/common/widgets/loader.dart';
import 'package:project_management/app/features/dashboard/models/task_approved.dart';

import 'package:project_management/app/utils/services/admin_services.dart';

// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:project_management/app/utils/widgets/single_approved_task.dart';

class TasksApproved extends StatefulWidget {
  const TasksApproved({Key? key}) : super(key: key);

  @override
  State<TasksApproved> createState() => _TasksApprovedState();
}

class _TasksApprovedState extends State<TasksApproved> {
  // temporary list
  List<TaskApproved>? tasks;

  final AdminServices accountServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchWallet();
  }

  void fetchWallet() async {
    tasks = await accountServices.fetchAllApprovedTask(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return tasks == null
        ? const Loader()
        : SingleChildScrollView(
            child: Column(
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
                  width: 330,
                  padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: tasks!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(
                          //   context,
                          //   TaskDetailsScreen.routeName,
                          //   arguments: tasks![index],
                          // );
                        },
                        child: SingleApprovedTask(
                          task: tasks![index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
