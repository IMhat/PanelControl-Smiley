import 'package:flutter/material.dart';
import 'package:project_management/app/features/dashboard/views/screens/dashboard_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/task_post.dart';

import 'package:project_management/app/shared_components/today_text.dart';
import 'package:project_management/app/utils/widgets/task_bar.dart';
import 'package:project_management/app/utils/widgets/task_bar2.dart';

import '../../controllers/task.dart';
import '../../controllers/task_approved.dart';
import '../../controllers/task_approved_controller.dart';
import '../../controllers/task_done.dart';
import '../../controllers/task_done_controller.dart';
import '../../controllers/task_inprogress.dart';
import '../../controllers/task_inprogress_controller.dart';
import '../../controllers/task_todo.dart';
import '../../controllers/task_todo_controller.dart';

class TasksScreen extends StatefulWidget {
  static const String route = '/tasks';
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // final LinearGradient _gradient = const LinearGradient(
  //     begin: Alignment.topCenter,
  //     end: Alignment.bottomCenter,
  //     colors: <Color>[
  //       (Color(0xff7F00F0)),
  //       Color.fromARGB(255, 165, 92, 179),
  //       Color.fromARGB(255, 247, 90, 98)
  //     ]);
  final decoration = const BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)));
  final textStyleTitle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  // final outlineButtonStyle = OutlinedButton.styleFrom(
  //     backgroundColor: const Color.fromARGB(255, 213, 215, 215),
  //     // elevation: 10,
  //     textStyle: const TextStyle(fontSize: 20),
  //     fixedSize: const Size(300, 50));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                const Text(
                  "SMILEY",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Color(0xff48409E)),
                ),
                const TodayText(),
                Container(
                  margin: const EdgeInsets.only(right: 150, top: 25),
                  child: const Text(
                    "Menú",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    child: Container(
                      decoration: decoration,
                      width: 200,
                      height: 50,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.menu_book,
                            color: Color(0xff48409E),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Task Board",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Color(0xff48409E)),
                          ),
                        ],
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
                      child: Row(
                        children: const [
                          Icon(
                            Icons.list_alt_sharp,
                            color: Color(0xffC4C4C4),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "List",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Color(0xffC4C4C4)),
                          ),
                        ],
                      ),
                    )),

                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    child: Container(
                      decoration: decoration,
                      width: 200,
                      height: 50,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            color: Color(0xffC4C4C4),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Products",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Color(0xffC4C4C4)),
                          ),
                        ],
                      ),
                    )),

                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    child: Container(
                      decoration: decoration,
                      width: 200,
                      height: 50,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.today,
                            color: Color(0xffC4C4C4),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Calendar",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Color(0xffC4C4C4)),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    child: Container(
                      decoration: decoration,
                      width: 200,
                      height: 50,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.drag_indicator_sharp,
                            color: Color(0xffC4C4C4),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Progres",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Color(0xffC4C4C4)),
                          ),
                        ],
                      ),
                    )),

                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    child: Container(
                      decoration: decoration,
                      width: 200,
                      height: 50,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.book,
                            color: Color(0xffC4C4C4),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Forms",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Color(0xffC4C4C4)),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  width: 250,
                  height: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Comunication",
                        style: TextStyle(
                            color: Color.fromARGB(255, 143, 143, 143),
                            fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            decoration: decoration,
                            width: 200,
                            height: 50,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.chat,
                                  color: Color(0xffC4C4C4),
                                ),
                                SizedBox(width: 15),
                                Text(
                                  "Chat",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Color(0xffC4C4C4)),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 40),
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.add,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          label: const Text(
                            "Add New Task",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            // Navigate to the overview page using a named route.
                            // Navigator.of(context)
                            //     .pushNamed(TaskPostScreen.route);
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: (const Color(0xff48409E)),
                            elevation: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
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
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
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
                          const Tasks(),
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
                        const TasksToDo()
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
                        const TasksInprogress()
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
                        const TasksDone()
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
                        const TasksApproved()
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// TextButton(
//                         onPressed: () {},
//                         child: Container(
//                           decoration: decoration,
//                           width: 200,
//                           height: 50,
//                           child: ShaderMask(
//                             shaderCallback: (Rect rect) {
//                               return _gradient.createShader(rect);
//                             },
//                             child: Row(
//                               mainAxisAlignment:
//                                   MainAxisAlignment.spaceEvenly,
//                               children: const [
//                                 Icon(
//                                   Icons.inbox_rounded,
//                                   color: Color(0xffA81BCC),
//                                 ),
//                                 Text(
//                                   "Inbox",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 25,
//                                       color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                         ),
