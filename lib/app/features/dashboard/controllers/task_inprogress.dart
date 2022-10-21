import 'package:project_management/app/common/widgets/loader.dart';
import 'package:project_management/app/features/dashboard/models/task_inprogress.dart';

import 'package:project_management/app/utils/services/admin_services.dart';

// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:project_management/app/utils/widgets/single_inprogress_task.dart';

class TasksInprogress extends StatefulWidget {
  const TasksInprogress({Key? key}) : super(key: key);

  @override
  State<TasksInprogress> createState() => _TasksInprogressState();
}

class _TasksInprogressState extends State<TasksInprogress> {
  // temporary list
  List<TaskInprogress>? tasks;

  final AdminServices accountServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchWallet();
  }

  void fetchWallet() async {
    tasks = await accountServices.fetchAllInprogressTask(context);
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
                        child: SingleInprogressTask(
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
