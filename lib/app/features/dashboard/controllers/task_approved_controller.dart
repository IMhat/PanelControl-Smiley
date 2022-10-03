import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// import '../../../utils/services/ToDo_task_service.dart';

import '../../../utils/services/approved_task_service.dart';
import '../../../utils/widgets/task_approved_card.dart';

import '../providers/task_approved_form_provider.dart';

import '../views/screens/task_post.dart';

//approved TASK

class getApprovedTask extends StatefulWidget {
  const getApprovedTask({Key? key}) : super(key: key);

  @override
  State<getApprovedTask> createState() => _getApprovedTask();
}

class _getApprovedTask extends State<getApprovedTask> {
  @override
  Widget build(BuildContext context) {
    final tasksService = Provider.of<TaskApprovedService>(context);

    return ChangeNotifierProvider(
      create: (_) => TaskFormProvider(tasksService.selectedTask),
      child: _getApprovedTaskBody(tasksService: tasksService),
    );
  }
}

class _getApprovedTaskBody extends StatefulWidget {
  _getApprovedTaskBody({Key? key, required this.tasksService})
      : super(key: key);

  TaskApprovedService tasksService;

  @override
  State<_getApprovedTaskBody> createState() => _getApprovedTaskBodyState();
}

class _getApprovedTaskBodyState extends State<_getApprovedTaskBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 40, bottom: 20),
            width: 270,
            height: 700,
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                //itemCount: taskListProvider.tasks.length,
                itemCount: widget.tasksService.tasksApproved.length,

                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    widget.tasksService.selectedTask =
                        widget.tasksService.tasksApproved[index].copy();
                    // Navigator.of(context).pushNamed(TaskPutScreen.route);
                    Navigator.pushNamed(
                      context,
                      '/taskPutApproved',
                    );
                  },
                  child: TaskApprovedCard(
                    taskApproved: widget.tasksService.tasksApproved[index],
                  ),
                ),
              ),
            ),
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.add, color: Colors.black),
            label: const Text(
              "Add New Task",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              // Navigate to the overview page using a named route.
              Navigator.of(context).pushNamed(TaskPostScreen.route);
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 130, 153),
              elevation: 10,
            ),
          ),
        ],
      ),
    );
  }
}
