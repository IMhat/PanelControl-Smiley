import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_management/app/utils/services/done_task_service.dart';
import 'package:project_management/app/utils/widgets/task_done_card.dart';
import 'package:provider/provider.dart';

// import '../../../utils/services/ToDo_task_service.dart';

import '../../../utils/services/inprogress_task_service.dart';
import '../../../utils/widgets/task_todo_card.dart';
import '../providers/task_done_form_provider.dart';
import '../views/screens/task_post.dart';

//ToDo TASK

class getDoneTask extends StatefulWidget {
  const getDoneTask({Key? key}) : super(key: key);

  @override
  State<getDoneTask> createState() => _getDoneTask();
}

class _getDoneTask extends State<getDoneTask> {
  @override
  Widget build(BuildContext context) {
    final tasksDoneService = Provider.of<TaskDoneService>(context);

    return ChangeNotifierProvider(
      create: (_) => TaskFormProvider(tasksDoneService.selectedTask),
      child: _getDoneTaskBody(tasksDoneService: tasksDoneService),
    );
  }
}

class _getDoneTaskBody extends StatefulWidget {
  _getDoneTaskBody({Key? key, required this.tasksDoneService})
      : super(key: key);

  TaskDoneService tasksDoneService;

  @override
  State<_getDoneTaskBody> createState() => _getDoneTaskBodyState();
}

class _getDoneTaskBodyState extends State<_getDoneTaskBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 40, bottom: 200),
            width: 270,
            height: 710,
            decoration: const BoxDecoration(
              color: Color(0xffBFB9FF),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                //itemCount: taskListProvider.tasks.length,
                itemCount: widget.tasksDoneService.tasksDone.length,

                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    widget.tasksDoneService.selectedTask =
                        widget.tasksDoneService.tasksDone[index].copy();
                    // Navigator.of(context).pushNamed(TaskPutScreen.route);
                    Navigator.pushNamed(
                      context,
                      '/taskPutDone',
                    );
                  },
                  child: TaskDoneCard(
                    taskDone: widget.tasksDoneService.tasksDone[index],
                  ),
                ),
              ),
            ),
          ),
          // OutlinedButton.icon(
          //   icon: const Icon(Icons.add, color: Colors.black),
          //   label: const Text(
          //     "Add New Task",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onPressed: () {
          //     // Navigate to the overview page using a named route.
          //     Navigator.of(context).pushNamed(TaskPostScreen.route);
          //   },
          //   style: OutlinedButton.styleFrom(
          //     backgroundColor: const Color.fromARGB(255, 0, 130, 153),
          //     elevation: 10,
          //   ),
          // ),
        ],
      ),
    );
  }
}
