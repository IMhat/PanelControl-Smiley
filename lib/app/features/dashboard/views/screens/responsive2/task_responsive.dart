import 'package:flutter/material.dart';

import '../../../../../utils/widgets/task_bar.dart';
import '../../../../../utils/widgets/task_bar2.dart';
import '../../../controllers/task.dart';
import '../../../controllers/task_approved.dart';
import '../../../controllers/task_done.dart';
import '../../../controllers/task_inprogress.dart';
import '../../../controllers/task_todo.dart';
import '../add_task_screen.dart';

class TaskResponsive extends StatelessWidget {
  const TaskResponsive({Key? key}) : super(key: key);
  final textStyle = const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
  final decoration = const BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)));
  final textStyleTitle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TaskBar(),
                const SizedBox(
                  height: 20,
                ),
                TaskBar2()
              ],
            )),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: 1800,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Backlog Tasks",
                            style: textStyleTitle,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.more_horiz,
                                color: Color.fromARGB(255, 0, 130, 153),
                              ))
                        ],
                      ),
                      Flex(direction: Axis.vertical, children: const [ Tasks()]),
                      Container(
                        margin: const EdgeInsets.only(right: 40),
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.add,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          label: const Text(
                            "Add New Task",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            // Navigate to the overview page using a named route.
                            Navigator.pushNamed(
                                context, AddTaskScreen.routeName);
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: (const Color(0xff48409E)),
                            elevation: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(children: [
                    Row(
                      children: [
                        Text("To Do Tasks", style: textStyleTitle),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Color.fromARGB(255, 0, 130, 153),
                            ))
                      ],
                    ),
                    Flex(direction: Axis.vertical, children: const [TasksToDo()])
                  ]),
                  Column(children: [
                    Row(
                      children: [
                        Text("In Progress", style: textStyleTitle),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Color.fromARGB(255, 0, 130, 153),
                            ))
                      ],
                    ),
                    Flex(
                        direction: Axis.vertical, children: const [TasksInprogress()])
                  ]),
                  Column(children: [
                    Row(
                      children: [
                        Text("Done", style: textStyleTitle),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Color.fromARGB(255, 0, 130, 153),
                            ))
                      ],
                    ),
                    Flex(direction: Axis.vertical, children: const [TasksDone()])
                  ]),
                  const SizedBox(width: 10),
                  Column(children: [
                    Row(
                      children: [
                        Text("Approved", style: textStyleTitle),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Color.fromARGB(255, 0, 130, 153),
                            ))
                      ],
                    ),
                    Flex(direction: Axis.vertical, children: const [TasksApproved()])
                  ]),
                ],
              ),
            ),
          ),
        ),
        // const SizedBox(height: kSpacing),
        // //_buildHeader(),
        // const SizedBox(height: kSpacing * 2),
        // //_buildProgress(),
        // const SizedBox(height: kSpacing * 2),
        // // _buildTaskOverview(
        // //   data: controller.getAllTask(),
        // //   crossAxisCount: 6,
        // //   crossAxisCellCount: (constraints.maxWidth < 1360) ? 3 : 2,
        // // ),
        // //const getAllTask(),
        // const SizedBox(height: kSpacing * 2),
        // // _buildActiveProject(
        // //   data: controller.getActiveProject(),
        // //   crossAxisCount: 6,
        // //   crossAxisCellCount: (constraints.maxWidth < 1360) ? 3 : 2,
        // // ),
        // const SizedBox(height: kSpacing),
      ],
    );
  }
}
