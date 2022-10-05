import 'package:flutter/material.dart';
import 'package:project_management/app/features/dashboard/views/screens/dashboard_screen.dart';

import 'package:project_management/app/shared_components/today_text.dart';
import 'package:project_management/app/utils/widgets/task_bar.dart';

import '../../controllers/task_approved_controller.dart';
import '../../controllers/task_done_controller.dart';
import '../../controllers/task_inprogress_controller.dart';
import '../../controllers/task_todo_controller.dart';

class TasksScreen extends StatefulWidget {
  static const String route = '/tasks';
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final LinearGradient _gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        (Color(0xff7F00F0)),
        Color.fromARGB(255, 165, 92, 179),
        Color.fromARGB(255, 247, 90, 98)
      ]);
  final decoration = const BoxDecoration(
      color: Color.fromARGB(255, 235, 234, 234),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)));
  // final textStyle = const TextStyle(
  //     fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  // final outlineButtonStyle = OutlinedButton.styleFrom(
  //     backgroundColor: const Color.fromARGB(255, 213, 215, 215),
  //     // elevation: 10,
  //     textStyle: const TextStyle(fontSize: 20),
  //     fixedSize: const Size(300, 50));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 244),
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
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            decoration: decoration,
                            width: 200,
                            height: 50,
                            child: ShaderMask(
                              shaderCallback: (Rect rect) {
                                return _gradient.createShader(rect);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.inbox_rounded,
                                    color: Color(0xffA81BCC),
                                  ),
                                  Text(
                                    "Inbox",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      // OutlinedButton.icon(
                      //   icon: const Icon(Icons.inbox_rounded,
                      //       color: Color.fromARGB(255, 0, 130, 153)),
                      //   label: const Text(
                      //     "Inbox",
                      //   ),
                      //   style: outlineButtonStyle,
                      //   onPressed: () {
                      //     // Navigate to the overview page using a named route.
                      //     //Navigator.of(context).pushNamed(TasksScreen.route);
                      //   },
                      // ),
                      const SizedBox(height: 10),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            decoration: decoration,
                            width: 200,
                            height: 50,
                            child: ShaderMask(
                              shaderCallback: (Rect rect) {
                                return _gradient.createShader(rect);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.update_rounded,
                                    color: Color(0xffA81BCC),
                                  ),
                                  Text(
                                    "Updates",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )),

                      const SizedBox(height: 10),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            decoration: decoration,
                            width: 200,
                            height: 50,
                            child: ShaderMask(
                              shaderCallback: (Rect rect) {
                                return _gradient.createShader(rect);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.analytics_outlined,
                                    color: Color(0xffA81BCC),
                                  ),
                                  Text(
                                    "Analytics",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )),

                      const SizedBox(height: 10),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            decoration: decoration,
                            width: 200,
                            height: 50,
                            child: ShaderMask(
                              shaderCallback: (Rect rect) {
                                return _gradient.createShader(rect);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.drive_file_move_outline,
                                    color: Color(0xffA81BCC),
                                  ),
                                  Text(
                                    "Drive files",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )),

                      const SizedBox(height: 10),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            decoration: decoration,
                            width: 200,
                            height: 50,
                            child: ShaderMask(
                              shaderCallback: (Rect rect) {
                                return _gradient.createShader(rect);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.settings_applications_sharp,
                                    color: Color(0xffA81BCC),
                                  ),
                                  Text(
                                    "Settings",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )),
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
                                    const Color.fromARGB(255, 198, 133, 231),
                                elevation: 10,
                              ),
                            ),
                            const SizedBox(height: 10),
                            OutlinedButton.icon(
                              icon: const Icon(Icons.numbers,
                                  color: Colors.black),
                              label: const Text("Desarrollo",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                // Navigate to the overview page using a named route.
                                //Navigator.of(context).pushNamed(TasksScreen.route);
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 60, 117, 240),
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
                                    const Color.fromARGB(255, 237, 204, 16),
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
                                    const Color.fromARGB(255, 255, 1, 1),
                                elevation: 10,
                              ),
                            ),
                            const SizedBox(height: 10),
                            OutlinedButton.icon(
                              icon: const Icon(Icons.add, color: Colors.black),
                              label: const Text("Add label",
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
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Backlog Tasks",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffE54580)),
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
                        const Text("To Do Tasks",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffBC29B3))),
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
                        const Text("In Progress",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffA81BCC))),
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
                        const Text("Done",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: (Color(0xff7F00F0)))),
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
                        const Text("Approved",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: (Color.fromARGB(255, 15, 73, 13)))),
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
