import 'package:project_management/app/common/widgets/loader.dart';
import 'package:project_management/app/features/dashboard/models/task_done.dart';

import 'package:project_management/app/utils/services/admin_services.dart';

// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:project_management/app/utils/widgets/single_done_task.dart';

import '../views/screens/task_detail_screen.dart';
import '../views/screens/task_done_details_screen.dart';

class TasksDone extends StatefulWidget {
  const TasksDone({Key? key}) : super(key: key);

  @override
  State<TasksDone> createState() => _TasksDoneState();
}

class _TasksDoneState extends State<TasksDone> {
  // temporary list
  List<TaskDone>? tasks;

  final AdminServices accountServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchWallet();
  }

  void fetchWallet() async {
    tasks = await accountServices.fetchAllDoneTask(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return tasks == null
        ? const Loader()
        : Container(
            margin: EdgeInsets.only(right: 20),
            width: 275,
            height: 710,
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
                      TaskDoneDetailsScreen.routeName,
                      arguments: tasks![index],
                    );
                  },
                  child: SingleDoneTask(
                    task: tasks![index],
                  ),
                );
              },
            ),
          );
  }
}
