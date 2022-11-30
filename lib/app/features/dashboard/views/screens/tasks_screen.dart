import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:project_management/app/features/dashboard/views/screens/responsive2/task_responsive.dart';
import 'package:project_management/app/utils/widgets/sidebar/sidebar_task.dart';
import '../../../../constans/app_constants.dart';
import '../../../../shared_components/responsive_builder.dart';

//  static const String routeName = '/tasks';
class TasksScreen extends GetView<StatefulWidget> {
  static const String routeName = '/tasks';
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      // key: controller.scaffoldKey,
      drawer: (ResponsiveBuilder.isDesktop(context))
          ? null
          : const Drawer(
              child: Padding(
                padding: EdgeInsets.only(top: kSpacing),
                child: SidebarTask(),
              ),
            ),
      appBar: AppBar(backgroundColor: const Color(0xff48409E)),
      body: SingleChildScrollView(
          child: ResponsiveBuilder(
        mobileBuilder: (context, constraints) {
          return Column(children: const [
            SizedBox(height: kSpacing * (kIsWeb ? 1 : 2)),
            TaskResponsive(),
          ]);
        },
        tabletBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: (constraints.maxWidth < 950) ? 6 : 9,
                  child: const TaskResponsive()),
              //const Flexible(flex: 4, child: TaskResponsive())
            ],
          );
        },
        desktopBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SidebarHomeTask(),
              Flexible(
                flex: (constraints.maxWidth < 1360) ? 4 : 3,
                child: const ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(kBorderRadius),
                      bottomRight: Radius.circular(kBorderRadius),
                    ),
                    child: SidebarTask()),
              ),
              const Flexible(flex: 9, child: TaskResponsive()),
            ],
          );
        },
      )),
    );
  }
}



  

  // final textStyle = const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
  // final LinearGradient _gradient = const LinearGradient(
  //     begin: Alignment.topCenter,
  //     end: Alignment.bottomCenter,
  //     colors: <Color>[
  //       (Color(0xff7F00F0)),
  //       Color.fromARGB(255, 165, 92, 179),
  //       Color.fromARGB(255, 247, 90, 98)
  //     ]);
  // final decoration = const BoxDecoration(
  //     color: Color.fromARGB(255, 255, 255, 255),
  //     borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(10),
  //         topRight: Radius.circular(10),
  //         bottomLeft: Radius.circular(10),
  //         bottomRight: Radius.circular(10)));
  // final textStyleTitle = const TextStyle(
  //     fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  // final outlineButtonStyle = OutlinedButton.styleFrom(
  //     backgroundColor: const Color.fromARGB(255, 213, 215, 215),
  //     // elevation: 10,
  //     textStyle: const TextStyle(fontSize: 20),
  //     fixedSize: const Size(300, 50));


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(backgroundColor: const Color(0xff48409E)),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Wrap(
//           children: [
//             Column(
//               children: [
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 const Text(
//                   "SMILEY",
//                   style: TextStyle(
//                       fontSize: 30,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xff48409E)),
//                 ),
//                 const TodayText(),
//                 Container(
//                   margin: const EdgeInsets.only(right: 150, top: 25),
//                   child: const Text(
//                     "Menú",
//                     style: TextStyle(
//                         color: Colors.black, fontWeight: FontWeight.w500),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       decoration: decoration,
//                       width: 200,
//                       height: 50,
//                       child: Row(
//                         children: const [
//                           Icon(
//                             Icons.menu_book,
//                             color: Color(0xff48409E),
//                           ),
//                           SizedBox(width: 15),
//                           Text(
//                             "Task Board",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 25,
//                                 color: Color(0xff48409E)),
//                           ),
//                         ],
//                       ),
//                     )),
//                 OutlinedButton.icon(
//                   icon: const Icon(Icons.inbox_rounded,
//                       color: Color.fromARGB(255, 0, 130, 153)),
//                   label: const Text(
//                     "Inbox",
//                   ),
//                   style: outlineButtonStyle,
//                   onPressed: () {
//                     // Navigate to the overview page using a named route.
//                     //Navigator.of(context).pushNamed(TasksScreen.route);
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pushNamed(OrdersScreen.routeName);
//                     },
//                     child: Container(
//                       decoration: decoration,
//                       width: 200,
//                       height: 50,
//                       child: Row(
//                         children: const [
//                           Icon(
//                             Icons.list_alt_sharp,
//                             color: Color(0xffC4C4C4),
//                           ),
//                           SizedBox(width: 15),
//                           Text(
//                             "List Orders",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 25,
//                                 color: Color(0xffC4C4C4)),
//                           ),
//                         ],
//                       ),
//                     )),

//                 const SizedBox(height: 10),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pushNamed(PostsScreen.routeName);
//                     },
//                     child: Container(
//                       decoration: decoration,
//                       width: 200,
//                       height: 50,
//                       child: Row(
//                         children: const [
//                           Icon(
//                             Icons.list,
//                             color: Color(0xffC4C4C4),
//                           ),
//                           SizedBox(width: 15),
//                           Text(
//                             "Products",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 25,
//                                 color: Color(0xffC4C4C4)),
//                           ),
//                         ],
//                       ),
//                     )),

//                 const SizedBox(height: 10),
//                 TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       decoration: decoration,
//                       width: 200,
//                       height: 50,
//                       child: Row(
//                         children: const [
//                           Icon(
//                             Icons.today,
//                             color: Color(0xffC4C4C4),
//                           ),
//                           SizedBox(width: 15),
//                           Text(
//                             "Calendar",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 25,
//                                 color: Color(0xffC4C4C4)),
//                           ),
//                         ],
//                       ),
//                     )),
//                 const SizedBox(height: 10),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, AnalyticsScreen.routeName);
//                     },
//                     child: Container(
//                       decoration: decoration,
//                       width: 200,
//                       height: 50,
//                       child: Row(
//                         children: const [
//                           Icon(
//                             Icons.drag_indicator_sharp,
//                             color: Color(0xffC4C4C4),
//                           ),
//                           SizedBox(width: 15),
//                           Text(
//                             "Analitycs",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 25,
//                                 color: Color(0xffC4C4C4)),
//                           ),
//                         ],
//                       ),
//                     )),

//                 const SizedBox(height: 10),
//                 TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       decoration: decoration,
//                       width: 200,
//                       height: 50,
//                       child: Row(
//                         children: const [
//                           Icon(
//                             Icons.book,
//                             color: Color(0xffC4C4C4),
//                           ),
//                           SizedBox(width: 15),
//                           Text(
//                             "Forms",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 25,
//                                 color: Color(0xffC4C4C4)),
//                           ),
//                         ],
//                       ),
//                     )),
//                 const SizedBox(height: 10),
//                 Container(
//                   margin: const EdgeInsets.only(top: 80),
//                   width: 250,
//                   height: 400,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Comunication",
//                         style: TextStyle(
//                             color: Color.fromARGB(255, 143, 143, 143),
//                             fontSize: 15),
//                       ),
//                       const SizedBox(height: 10),
//                       TextButton(
//                           onPressed: () {},
//                           child: Container(
//                             decoration: decoration,
//                             width: 200,
//                             height: 50,
//                             child: Row(
//                               children: const [
//                                 Icon(
//                                   Icons.chat,
//                                   color: Color(0xffC4C4C4),
//                                 ),
//                                 SizedBox(width: 15),
//                                 Text(
//                                   "Chat",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 20,
//                                       color: Color(0xffC4C4C4)),
//                                 ),
//                               ],
//                             ),
//                           )),
//                       SizedBox(
//                         height: 20,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             Column(
//               children: [
//                 SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Column(
//                       children: [
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         TaskBar(),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         TaskBar2()
//                       ],
//                     )),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "Backlog Tasks",
//                                 style: textStyleTitle,
//                               ),
//                               IconButton(
//                                   onPressed: () {},
//                                   icon: const Icon(
//                                     Icons.more_horiz,
//                                     color: Color.fromARGB(255, 0, 130, 153),
//                                   ))
//                             ],
//                           ),
//                           const Tasks(),
//                           Container(
//                             margin: EdgeInsets.only(right: 40),
//                             child: OutlinedButton.icon(
//                               icon: const Icon(Icons.add,
//                                   color: Color.fromARGB(255, 255, 255, 255)),
//                               label: const Text(
//                                 "Add New Task",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                               onPressed: () {
//                                 Navigate to the overview page using a named route.
//                                 Navigator.pushNamed(
//                                     context, AddTaskScreen.routeName);
//                               },
//                               style: OutlinedButton.styleFrom(
//                                 backgroundColor: (const Color(0xff48409E)),
//                                 elevation: 10,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(children: [
//                         Row(
//                           children: [
//                             Text("To Do Tasks", style: textStyleTitle),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(
//                                   Icons.more_horiz,
//                                   color: Color.fromARGB(255, 0, 130, 153),
//                                 ))
//                           ],
//                         ),
//                         const TasksToDo()
//                       ]),
//                       Column(children: [
//                         Row(
//                           children: [
//                             Text("In Progress", style: textStyleTitle),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(
//                                   Icons.more_horiz,
//                                   color: Color.fromARGB(255, 0, 130, 153),
//                                 ))
//                           ],
//                         ),
//                         const TasksInprogress()
//                       ]),
//                       Column(children: [
//                         Row(
//                           children: [
//                             Text("Done", style: textStyleTitle),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(
//                                   Icons.more_horiz,
//                                   color: Color.fromARGB(255, 0, 130, 153),
//                                 ))
//                           ],
//                         ),
//                         const TasksDone()
//                       ]),
//                       const SizedBox(width: 10),
//                       Column(children: [
//                         Row(
//                           children: [
//                             Text("Approved", style: textStyleTitle),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(
//                                   Icons.more_horiz,
//                                   color: Color.fromARGB(255, 0, 130, 153),
//                                 ))
//                           ],
//                         ),
//                         const TasksApproved()
//                       ]),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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