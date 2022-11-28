import 'package:project_management/app/common/widgets/loader.dart';
import 'package:project_management/app/features/dashboard/models/task_approved.dart';

import 'package:project_management/app/utils/services/admin_services.dart';

// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:project_management/app/utils/widgets/single_approved_task.dart';

import '../views/screens/task_approved_details_screen.dart';

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
        : Container(
            margin: const EdgeInsets.only(right: 20),
            width: 275,
            height: 710,
            decoration: const BoxDecoration(
              color: Color(0xffBFB9FF),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              //physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: tasks!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      TaskApprovedDetailsScreen.routeName,
                      arguments: tasks![index],
                    );
                  },
                  child: SingleApprovedTask(
                    task: tasks![index],
                  ),
                );
              },
            ),
          );
  }
}
