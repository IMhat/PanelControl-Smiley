import 'package:flutter/material.dart';
import 'package:project_management/app/features/dashboard/controllers/task_approved_controller.dart';
import 'package:project_management/app/features/dashboard/controllers/task_done_controller.dart';
import 'package:project_management/app/features/dashboard/controllers/task_inprogress_controller.dart';
import 'package:project_management/app/features/dashboard/views/screens/dashboard_screen.dart';
import 'package:project_management/app/shared_components/chatting_card.dart';
import 'package:project_management/app/shared_components/today_text.dart';
import 'package:project_management/app/utils/widgets/task_bar.dart';

import '../../controllers/task_todo_controller.dart';

class TasksScreen extends StatefulWidget {
  static const String route = '/tasks';
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final textStyle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  final outlineButtonStyle = OutlinedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 213, 215, 215),
      // elevation: 10,
      textStyle: const TextStyle(fontSize: 20),
      fixedSize: const Size(300, 50));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 224, 226),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
                scrollDirection: Axis.horizontal, child: TaskBar()),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      const TodayText(),
                      const SizedBox(height: 10),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.inbox_rounded,
                            color: Color.fromARGB(255, 0, 130, 153)),
                        label: const Text(
                          "Inbox",
                        ),
                        style: outlineButtonStyle,
                        onPressed: () {
                          // Navigate to the overview page using a named route.
                          //Navigator.of(context).pushNamed(TasksScreen.route);
                        },
                      ),
                      const SizedBox(height: 10),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.drive_file_move_outline,
                            color: Color.fromARGB(255, 0, 130, 153)),
                        label: const Text(
                          "Drive Files",
                        ),
                        onPressed: () {
                          // Navigate to the overview page using a named route.
                          // Navigator.of(context).pushNamed(TasksScreen.route);
                        },
                        style: outlineButtonStyle,
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.settings_applications_sharp,
                            color: Color.fromARGB(255, 0, 130, 153)),
                        label: const Text(
                          "Settings",
                        ),
                        style: outlineButtonStyle,
                        onPressed: () {
                          // Navigate to the overview page using a named route.
                          //Navigator.of(context).pushNamed(TasksScreen.route);
                        },
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(top: 80),
                        width: 250,
                        height: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OutlinedButton.icon(
                              icon: const Icon(Icons.numbers,
                                  color: Colors.black),
                              label: const Text("Maquetado",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                // Navigate to the overview page using a named route.
                                //Navigator.of(context).pushNamed(TasksScreen.route);
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 130, 153),
                                elevation: 10,
                              ),
                            ),
                            const SizedBox(height: 10),
                            OutlinedButton.icon(
                              icon: const Icon(Icons.numbers,
                                  color: Colors.black),
                              label: const Text("En desarrollo",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                // Navigate to the overview page using a named route.
                                //Navigator.of(context).pushNamed(TasksScreen.route);
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 130, 153),
                                elevation: 10,
                              ),
                            ),
                            const SizedBox(height: 10),
                            OutlinedButton.icon(
                              icon: const Icon(Icons.numbers,
                                  color: Colors.black),
                              label: const Text("Listo para ejecutar",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                // Navigate to the overview page using a named route.
                                //Navigator.of(context).pushNamed(TasksScreen.route);
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 130, 153),
                                elevation: 10,
                              ),
                            ),
                            const SizedBox(height: 10),
                            OutlinedButton.icon(
                              icon: const Icon(Icons.numbers,
                                  color: Colors.black),
                              label: const Text("Marketing",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                // Navigate to the overview page using a named route.
                                //Navigator.of(context).pushNamed(TasksScreen.route);
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 130, 153),
                                elevation: 10,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Backlog Tasks",
                            style: textStyle,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.more_horiz,
                                color: Color.fromARGB(255, 0, 130, 153),
                              ))
                        ],
                      ),
                      const getBacklogTask()
                    ],
                  ),
                  Column(children: [
                    Row(
                      children: [
                        Text("To Do Tasks", style: textStyle),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Color.fromARGB(255, 0, 130, 153),
                            ))
                      ],
                    ),
                    const getToDoTask()
                  ]),
                  Column(children: [
                    Row(
                      children: [
                        Text("In Progress", style: textStyle),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Color.fromARGB(255, 0, 130, 153),
                            ))
                      ],
                    ),
                    const getInProgressTask()
                  ]),
                  Column(children: [
                    Row(
                      children: [
                        Text("Done", style: textStyle),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Color.fromARGB(255, 0, 130, 153),
                            ))
                      ],
                    ),
                    const getDoneTask()
                  ]),
                  const SizedBox(width: 10),
                  Column(children: [
                    Row(
                      children: [
                        Text("Approved", style: textStyle),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Color.fromARGB(255, 0, 130, 153),
                            ))
                      ],
                    ),
                    const getApprovedTask()
                  ]),
                  const SizedBox(width: 10),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     OutlinedButton.icon(
                  //       icon: const Icon(Icons.numbers, color: Colors.black),
                  //       label: const Text("Linkdln",
                  //           style: TextStyle(color: Colors.white)),
                  //       onPressed: () {
                  //         // Navigate to the overview page using a named route.
                  //         //Navigator.of(context).pushNamed(TasksScreen.route);
                  //       },
                  //       style: OutlinedButton.styleFrom(
                  //         backgroundColor:
                  //             const Color.fromARGB(255, 0, 130, 153),
                  //         elevation: 10,
                  //       ),
                  //     ),
                  //     const SizedBox(height: 10),
                  //     OutlinedButton.icon(
                  //       icon: const Icon(Icons.numbers, color: Colors.black),
                  //       label: const Text("Twiter",
                  //           style: TextStyle(color: Colors.white)),
                  //       onPressed: () {
                  //         // Navigate to the overview page using a named route.
                  //         //Navigator.of(context).pushNamed(TasksScreen.route);
                  //       },
                  //       style: OutlinedButton.styleFrom(
                  //         backgroundColor:
                  //             const Color.fromARGB(255, 0, 130, 153),
                  //         elevation: 10,
                  //       ),
                  //     ),
                  //     const SizedBox(height: 10),
                  //     OutlinedButton.icon(
                  //       icon: const Icon(Icons.numbers, color: Colors.black),
                  //       label: const Text("Faceboock",
                  //           style: TextStyle(color: Colors.white)),
                  //       onPressed: () {
                  //         // Navigate to the overview page using a named route.
                  //         //Navigator.of(context).pushNamed(TasksScreen.route);
                  //       },
                  //       style: OutlinedButton.styleFrom(
                  //         backgroundColor:
                  //             const Color.fromARGB(255, 0, 130, 153),
                  //         elevation: 10,
                  //       ),
                  //     ),
                  //     const SizedBox(height: 10),
                  //     OutlinedButton.icon(
                  //       icon: const Icon(Icons.numbers, color: Colors.black),
                  //       label: const Text("Instagram",
                  //           style: TextStyle(color: Colors.white)),
                  //       onPressed: () {
                  //         // Navigate to the overview page using a named route.
                  //         //Navigator.of(context).pushNamed(TasksScreen.route);
                  //       },
                  //       style: OutlinedButton.styleFrom(
                  //         backgroundColor:
                  //             const Color.fromARGB(255, 0, 130, 153),
                  //         elevation: 10,
                  //       ),
                  //     ),
                  //   ],
                  // )
                  // getAllTask(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
