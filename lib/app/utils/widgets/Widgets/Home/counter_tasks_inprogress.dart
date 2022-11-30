import 'package:project_management/app/common/widgets/loader.dart';
import 'package:project_management/app/features/dashboard/models/task_inprogress.dart';

import 'package:project_management/app/utils/services/admin_services.dart';

// import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';

import 'package:flutter/material.dart';

class CounterTasksInprogress extends StatefulWidget {
  const CounterTasksInprogress({Key? key}) : super(key: key);

  @override
  State<CounterTasksInprogress> createState() => _CounterTasksInprogressState();
}

class _CounterTasksInprogressState extends State<CounterTasksInprogress> {
  // tempCounteroraryCounter list
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
            width: 200,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 250, 249, 249),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(135, 136, 136, 136),
                    blurRadius: 20.0,
                  ),
                  BoxShadow(
                    color: Color.fromARGB(255, 233, 232, 232),
                  ),
                ]),
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 243, 173, 33),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: const Icon(
                    Icons.incomplete_circle_sharp,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "In Progress",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          tasks!.length.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "Tasks",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
