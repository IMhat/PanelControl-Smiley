// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';

// import '../../../utils/services/ToDo_task_service.dart';

// import '../../../utils/widgets/task_todo_card.dart';
// import '../providers/task_todo_form_provider.dart';
// import '../../../utils/widgets/task_card.dart';

// import '../views/screens/task_post.dart';

// //ToDo TASK

// class getToDoTask extends StatefulWidget {
//   const getToDoTask({Key? key}) : super(key: key);

//   @override
//   State<getToDoTask> createState() => _getToDoTask();
// }

// class _getToDoTask extends State<getToDoTask> {
//   @override
//   Widget build(BuildContext context) {
//     final tasksToDoService = Provider.of<TaskToDoService>(context);

//     return ChangeNotifierProvider(
//       create: (_) => TaskFormProvider(tasksToDoService.selectedTask),
//       child: _getToDoTaskBody(tasksToDoService: tasksToDoService),
//     );
//   }
// }

// class _getToDoTaskBody extends StatefulWidget {
//   _getToDoTaskBody({Key? key, required this.tasksToDoService})
//       : super(key: key);

//   TaskToDoService tasksToDoService;

//   @override
//   State<_getToDoTaskBody> createState() => _getToDoTaskBodyState();
// }

// class _getToDoTaskBodyState extends State<_getToDoTaskBody> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.only(top: 20, left: 40, bottom: 200),
//             width: 270,
//             height: 710,
//             decoration: const BoxDecoration(
//               color: Color(0xffBFB9FF),
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//             child: Center(
//               child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 //itemCount: taskListProvider.tasks.length,
//                 itemCount: widget.tasksToDoService.tasksToDo.length,

//                 itemBuilder: (BuildContext context, int index) =>
//                     GestureDetector(
//                   onTap: () {
//                     widget.tasksToDoService.selectedTask =
//                         widget.tasksToDoService.tasksToDo[index].copy();
//                     // Navigator.of(context).pushNamed(TaskPutScreen.route);
//                     Navigator.pushNamed(
//                       context,
//                       '/taskPutToDo',
//                     );
//                   },
//                   child: TaskToDoCard(
//                     tasktodo: widget.tasksToDoService.tasksToDo[index],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // OutlinedButton.icon(
//           //   icon: const Icon(Icons.add, color: Colors.black),
//           //   label: const Text(
//           //     "Add New Task",
//           //     style: TextStyle(color: Colors.white),
//           //   ),
//           //   onPressed: () {
//           //     // Navigate to the overview page using a named route.
//           //     Navigator.of(context).pushNamed(TaskPostScreen.route);
//           //   },
//           //   style: OutlinedButton.styleFrom(
//           //     backgroundColor: const Color.fromARGB(255, 0, 130, 153),
//           //     elevation: 10,
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
