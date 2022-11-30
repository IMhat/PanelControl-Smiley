import 'package:project_management/app/common/widgets/loader.dart';
import 'package:project_management/app/features/dashboard/models/tasks.dart';
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
              Container(
                margin: const EdgeInsets.only(right: 20),
                width: 275,
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
