import 'package:flutter/material.dart';

import 'package:project_management/app/features/dashboard/models/task_inprogress.dart';
import 'package:project_management/app/features/dashboard/models/task_todo.dart';
import 'package:project_management/app/features/dashboard/views/screens/search_screen.dart';

import '../../../../utils/services/admin_services.dart';

class TaskToDoDetailsScreen extends StatefulWidget {
  static const String routeName = '/task-todo-details';

  final TaskToDo task;

  const TaskToDoDetailsScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<TaskToDoDetailsScreen> createState() => _TaskToDoDetailsScreenState();
}

class _TaskToDoDetailsScreenState extends State<TaskToDoDetailsScreen> {
  final AdminServices productDetailsServices = AdminServices();

  // void acept() {
  //   productDetailsServices.accept(
  //     context: context,
  //     assignmentUser: widget.task.assignmentUser,
  //     category: widget.task.category,
  //     createdBy: widget.task.createdBy,
  //     description: widget.task.description,
  //     points: widget.task.points,
  //     priority: widget.task.priority,
  //     id: widget.task.id,
  //     title: widget.task.title,
  //     status: "inprogress",

  //     // Navigator.pushNamed(
  //     //   context,
  //     //   'ChallengeAcepted',
  //     // );
  //   );
  //   Navigator.pushNamed(
  //     context,
  //     'ChallengeAcepted',
  //   );
  // }

  // double avgRating = 0;
  // double myRating = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   double totalRating = 0;
  //   for (int i = 0; i < widget.product.rating!.length; i++) {
  //     totalRating += widget.product.rating![i].rating;
  //     if (widget.product.rating![i].userId ==
  //         Provider.of<UserProvider>(context, listen: false).user.id) {
  //       myRating = widget.product.rating![i].rating;
  //     }
  //   }

  //   if (totalRating != 0) {
  //     avgRating = totalRating / widget.product.rating!.length;
  //   }
  // }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  // void addToCart() {
  //   productDetailsServices.addToCart(
  //     context: context,
  //     product: widget.product,
  //   );
  // }
  final elevatedButtonStyle = ElevatedButton.styleFrom(
      shadowColor: const Color.fromARGB(255, 54, 57, 244),
      elevation: 10,
      primary: Colors.deepPurple,
      onPrimary: Colors.white);

  final buttonStyleDowload = ElevatedButton.styleFrom(
      elevation: 0,
      primary: const Color.fromARGB(255, 205, 203, 203),
      onPrimary: const Color.fromARGB(255, 0, 34, 255));
  final textStyleTitle = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 203, 203),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Flex(direction: Axis.vertical, children: [
                Text(
                  widget.task.title,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  textAlign: TextAlign.center,
                ),
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.only(right: 20),
                width: 400,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Para",
                      style: textStyleTitle,
                    ),
                    Container(
                      width: 250,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(50)),
                      child: Stack(
                        children: [
                          LayoutBuilder(
                              builder: (context, constraints) => Container(
                                    width: constraints.maxWidth * 10,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 199, 197, 198),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  )),
                          Positioned.fill(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage:
                                      AssetImage('assets/user.png'),
                                ),
                                Flex(direction: Axis.horizontal, children: [
                                  Text(
                                    widget.task.assignmentUser,
                                    style: const TextStyle(fontSize: 10),
                                    textAlign: TextAlign.center,
                                  ),
                                ]),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(left: 200),
              padding: const EdgeInsets.all(10.0),
              width: 120,
              height: 45,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 98, 98),
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 251, 251)),
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                widget.task.status,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(right: 200),
                child: Text(
                  "Descripción",
                  style: textStyleTitle,
                )),
            const Divider(
              indent: 5,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15.0),

              // decoration: BoxDecoration(
              //     border:
              //         Border.all(color: const Color.fromARGB(255, 0, 21, 255)),
              //     borderRadius: BorderRadius.circular(10)),
              child: Flex(direction: Axis.vertical, children: [
                Text(
                  widget.task.description,
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 9, 0, 0)),
                  textAlign: TextAlign.justify,
                ),
              ]),
            ),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.only(left: 0),
                width: 500,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.file_copy),
                    //Image(image: AssetImage("assets/tareaasignada.jpg")),
                    const Text("34 MB"),
                    ElevatedButton(
                      style: buttonStyleDowload,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '',
                        );
                      },
                      child: const Text("Download"),
                    ),
                  ],
                )),
            Container(
                padding: const EdgeInsets.only(left: 0),
                width: 500,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("Aa",
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                    Icon(Icons.emoji_emotions_outlined),
                    Icon(Icons.attach_file),
                    Icon(Icons.today_outlined),
                    Text(
                      "vence 10/10/22",
                      style: TextStyle(color: Colors.red),
                    ),
                    Icon(Icons.person_add)
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(left: 100),
              child: Row(
                children: [
                  Text(
                    ' ${widget.task.points}',
                    style: const TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 27, 112, 248),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    " Puntos",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 27, 112, 248)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 80),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: AlignmentDirectional.topEnd,
                          colors: [
                            Color.fromARGB(255, 242, 133, 157),
                            Color.fromARGB(255, 167, 79, 211),
                          ]),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // widget.task.assignmentUser;
                        // widget.task.category;
                        // widget.task.createdBy;
                        // widget.task.description;
                        // widget.task.points;
                        // widget.task.priority;
                        // widget.task.id;
                        // widget.task.title;
                        // widget.task.status = "inprogress";
                        // productDetailsServices.updateTask(widget.task,
                        //     context: context);
                        // acept();
                      },
                      child: const Text(
                        "Guardar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                  // Container(
                  //   width: 100,
                  //   decoration: BoxDecoration(
                  //     gradient: const LinearGradient(
                  //         begin: AlignmentDirectional.topEnd,
                  //         colors: [
                  //           Color.fromARGB(255, 242, 164, 133),
                  //           Color.fromARGB(255, 255, 0, 0),
                  //         ]),
                  //     borderRadius: BorderRadius.circular(3.0),
                  //   ),
                  //   child: TextButton(
                  //     onPressed: () {
                  //       Navigator.pushNamed(
                  //         context,
                  //         'ChallengeAcepted',
                  //       );
                  //     },
                  //     child: const Text(
                  //       "Rechazar",
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
