// import 'package:flutter/material.dart';

// import '../../features/dashboard/models/task.dart';

// class TaskCard extends StatelessWidget {
//   final Task task;

//   const TaskCard({Key? key, required this.task}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(2.0),
//       margin: const EdgeInsets.only(top: 0, bottom: 50),
//       width: 200, height: 300,
//       //decoration: _cardBorders(),
//       child: Stack(
//         alignment: Alignment.bottomLeft,
//         children: [
//           _TaskDetails(
//             //title: taskListProvider.tasks[i].title,
//             // subTitle: taskListProvider.tasks[i].description,
//             title: task.title,
//             subTitle: task.description,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _TaskDetails extends StatefulWidget {
//   final String? title;
//   final String? subTitle;

//   const _TaskDetails({this.title, this.subTitle});

//   @override
//   State<_TaskDetails> createState() => _TaskDetailsState();
// }

// class _TaskDetailsState extends State<_TaskDetails> {
//   final elevatedButtonStyle = ElevatedButton.styleFrom(
//       shadowColor: Color.fromARGB(255, 54, 57, 244),
//       elevation: 10,
//       primary: Colors.deepPurple,
//       onPrimary: Colors.white);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       width: 280,
//       height: 300,
//       decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 231, 170, 209),
//           borderRadius: const BorderRadius.all(Radius.circular(20)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey[850]!.withOpacity(0.29),
//               offset: const Offset(-10, 10),
//               blurRadius: 10,
//             )
//           ]),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             widget.title.toString(),
//             style: const TextStyle(
//                 fontSize: 20,
//                 color: Color.fromARGB(255, 7, 0, 0),
//                 fontWeight: FontWeight.bold),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           Text(
//             widget.subTitle.toString(),
//             style: const TextStyle(
//                 fontSize: 15, color: Color.fromARGB(255, 9, 0, 0)),
//           ),
//           const SizedBox(height: 40),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             // children: [
//             //   ElevatedButton(
//             //     style: elevatedButtonStyle,
//             //     onPressed: () {
//             //       Navigator.pushNamed(
//             //         context,
//             //         'TaskDetail',
//             //       );
//             //     },
//             //     child: const Text("Ver"),
//             //   ),
//             //   ElevatedButton(
//             //     style: elevatedButtonStyle,
//             //     onPressed: () {
//             //       Navigator.pushNamed(
//             //         context,
//             //         'tasksPost',
//             //       );
//             //     },
//             //     child: const Text("Empezar"),
//             //   ),
//             // ],
//           ),
//         ],
//       ),
//     );
//   }
// }

//   // BoxDecoration _buildBoxDecoration() => const BoxDecoration(
//   //     color: Colors.indigo,
//   //     borderRadius: BorderRadius.only(
//   //         bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
// }

// class MyButtonBeginning extends StatelessWidget {
//   const MyButtonBeginning({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // The GestureDetector wraps the button.
//     return GestureDetector(
//       // When the child is tapped, show a snackbar.
//       onTap: () {
//         Navigator.pushNamed(
//           context,
//           'tasksPost',
//         );
//       },
//       // The custom button
//       child: Container(
//         width: 130,
//         height: 30,
//         padding: const EdgeInsets.all(12.0),
//         decoration: BoxDecoration(
//           gradient: const LinearGradient(
//               begin: AlignmentDirectional.topEnd,
//               colors: [
//                 Color.fromARGB(255, 242, 133, 157),
//                 Color.fromARGB(255, 167, 79, 211)
//               ]),
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: const Text(
//           'Empezar',
//           style: TextStyle(color: Colors.white, fontSize: 10),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }

