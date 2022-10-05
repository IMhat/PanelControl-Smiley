import 'package:flutter/material.dart';
import 'package:project_management/app/features/dashboard/models/task_todo.dart';
import '../../constans/app_constants.dart';

class TaskToDoCard extends StatelessWidget {
  final TaskToDo tasktodo;

  const TaskToDoCard({Key? key, required this.tasktodo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.only(top: 0, bottom: 50),
      width: 400, height: 190,
      //decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _TaskDetails(
            //title: taskListProvider.tasks[i].title,
            // subTitle: taskListProvider.tasks[i].description,
            title: tasktodo.title,
            // subTitle: task.description,
            type: tasktodo.type,
            priority: tasktodo.priority,
          ),
        ],
      ),

      //   floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () => Navigator.pushNamed(context, 'taskPost'),
      // )
    );
  }
}

class _TaskDetails extends StatefulWidget {
  final String? title;
  final String? type;
  final String? priority;
  //final String? subTitle;

  const _TaskDetails({this.title, this.type, this.priority});

  @override
  State<_TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<_TaskDetails> {
  final elevatedButtonStyle = ElevatedButton.styleFrom(
      shadowColor: const Color.fromARGB(255, 54, 57, 244),
      elevation: 10,
      primary: Colors.deepPurple,
      onPrimary: Colors.white);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: 260,
        height: 180,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[850]!.withOpacity(0.29),
                offset: const Offset(-10, 10),
                blurRadius: 10,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                          color: const Color.fromARGB(255, 255, 251, 251)),
                      borderRadius: BorderRadius.circular(50)),
                ),
                Text(
                  widget.title.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Icon(
                  Icons.menu,
                  color: Color.fromARGB(255, 0, 130, 153),
                ),
              ],
            ),

            SizedBox(
              height: 50,
              child: Text(
                widget.priority.toString(),
                style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                          color: const Color.fromARGB(255, 255, 251, 251)),
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    widget.type.toString(),
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                    textAlign: TextAlign.center,
                  ),
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage(ImageRasterPath.avatar1),
                )
              ],
            ),
            // Text(
            //   widget.subTitle.toString(),
            //   style: const TextStyle(
            //       fontSize: 15, color: Color.fromARGB(255, 9, 0, 0)),
            // ),
            const SizedBox(
              height: 40,
              child: Icon(
                Icons.comment_bank,
                color: Color.fromARGB(255, 0, 130, 153),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ],
        ),
      ),
    );
  }
}
