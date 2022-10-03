import 'package:flutter/material.dart';
import 'package:project_management/app/features/dashboard/views/screens/dashboard_screen.dart';

import 'package:project_management/app/shared_components/today_text.dart';
import 'package:project_management/app/utils/widgets/task_bar.dart';

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
                      TextButton(
                          onPressed: () {},
                          child: Container(
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
                                    const Color.fromARGB(255, 197, 48, 239),
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
                                    Color.fromARGB(255, 2, 14, 255),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Backlog Tasks",
                            style: TextStyle(
                                fontSize: 30,
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
                      const getAllTask()
                    ],
                  ),
                  Column(children: [
                    Row(
                      children: [
                        const Text("To Do Tasks",
                            style: TextStyle(
                                fontSize: 30,
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
                    const getAllTask()
                  ]),
                  Column(children: [
                    Row(
                      children: [
                        const Text("In Progress",
                            style: TextStyle(
                                fontSize: 30,
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
                    const getAllTask()
                  ]),
                  Column(children: [
                    Row(
                      children: [
                        const Text("Done",
                            style: TextStyle(
                                fontSize: 30,
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
                    const getAllTask()
                  ]),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      OutlinedButton.icon(
                        icon: const Icon(Icons.numbers, color: Colors.black),
                        label: const Text("Linkdln",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          // Navigate to the overview page using a named route.
                          //Navigator.of(context).pushNamed(TasksScreen.route);
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 52, 65, 242),
                          elevation: 10,
                        ),
                      ),
                      const SizedBox(height: 10),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.numbers, color: Colors.black),
                        label: const Text("Twiter",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          // Navigate to the overview page using a named route.
                          //Navigator.of(context).pushNamed(TasksScreen.route);
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: (const Color(0xff00ACEE)),
                          elevation: 10,
                        ),
                      ),
                      const SizedBox(height: 10),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.numbers, color: Colors.black),
                        label: const Text("Faceboock",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          // Navigate to the overview page using a named route.
                          //Navigator.of(context).pushNamed(TasksScreen.route);
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: (const Color(0xff3B5998)),
                          elevation: 10,
                        ),
                      ),
                      const SizedBox(height: 10),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.numbers, color: Colors.black),
                        label: const Text("Instagram",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          // Navigate to the overview page using a named route.
                          //Navigator.of(context).pushNamed(TasksScreen.route);
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 151, 67, 92),
                          elevation: 10,
                        ),
                      ),
                    ],
                  )
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
