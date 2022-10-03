import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// import '../../../utils/services/ToDo_task_service.dart';

import '../../../utils/services/inprogress_task_service.dart';
import '../../../utils/widgets/task_inprogress_card.dart';

import '../providers/task_inprogress_form_provider.dart';
import '../views/screens/task_post.dart';

//ToDo TASK

class getInProgressTask extends StatefulWidget {
  const getInProgressTask({Key? key}) : super(key: key);

  @override
  State<getInProgressTask> createState() => _getInProgressTask();
}

class _getInProgressTask extends State<getInProgressTask> {
  @override
  Widget build(BuildContext context) {
    final tasksService = Provider.of<TaskInprogressService>(context);

    return ChangeNotifierProvider(
      create: (_) => TaskFormProvider(tasksService.selectedTask),
      child: _getInProgressTaskBody(tasksService: tasksService),
    );
  }
}

class _getInProgressTaskBody extends StatefulWidget {
  _getInProgressTaskBody({Key? key, required this.tasksService})
      : super(key: key);

  TaskInprogressService tasksService;

  @override
  State<_getInProgressTaskBody> createState() => _getInProgressTaskBodyState();
}

class _getInProgressTaskBodyState extends State<_getInProgressTaskBody> {
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
                itemCount: widget.tasksService.tasksInprogress.length,

                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    widget.tasksService.selectedTask =
                        widget.tasksService.tasksInprogress[index].copy();
                    // Navigator.of(context).pushNamed(TaskPutScreen.route);
                    Navigator.pushNamed(
                      context,
                      '/taskPutInprogress',
                    );
                  },
                  child: TaskInprogressCard(
                    taskInprogress: widget.tasksService.tasksInprogress[index],
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
