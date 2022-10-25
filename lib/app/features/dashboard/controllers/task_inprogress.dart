import 'package:project_management/app/common/widgets/loader.dart';
import 'package:project_management/app/features/dashboard/models/task_inprogress.dart';

import 'package:project_management/app/utils/services/admin_services.dart';

// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:project_management/app/utils/widgets/single_inprogress_task.dart';

import '../views/screens/task_detail_screen.dart';
import '../views/screens/task_inprogress_detail_screen.dart';

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
        : Container(
            margin: EdgeInsets.only(right: 20),
            width: 330,
            height: 710,
            padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: tasks!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      TaskInprogressDetailsScreen.routeName,
                      arguments: tasks![index],
                    );
                  },
                  child: SingleInprogressTask(
                    task: tasks![index],
                  ),
                );
              },
            ),
          );
  }
}
