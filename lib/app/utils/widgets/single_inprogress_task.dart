import 'package:flutter/material.dart';
import 'package:project_management/app/constans/app_constants.dart';
import 'package:project_management/app/features/dashboard/models/task_inprogress.dart';

import 'package:project_management/app/shared_components/today_text.dart';

class SingleInprogressTask extends StatelessWidget {
  final TaskInprogress task;

  const SingleInprogressTask({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.only(top: 2),
      width: 400, height: 200,
      //decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _TaskDetails(
            //title: taskListProvider.tasks[i].title,
            // subTitle: taskListProvider.tasks[i].description,
            title: task.title,
            // subTitle: task.description,
            type: task.status,
            priority: task.priority,
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
        margin: const EdgeInsets.only(top: 2, left: 3),
        width: 260,
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container(
                //   padding: const EdgeInsets.only(top: 5),
                //   width: 10,
                //   height: 10,
                //   decoration: BoxDecoration(
                //       color: const Color.fromARGB(255, 239, 127, 72),
                //       border: Border.all(
                //           color: const Color.fromARGB(255, 255, 251, 251)),
                //       borderRadius: BorderRadius.circular(50)),
                // ),
                SizedBox(
                  width: 180,
                  height: 40,
                  child: Text(
                    widget.title.toString(),
                    style: const TextStyle(
                        fontSize: 14,
                        color: (Color(0xff6F6F6F)),
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(
                  Icons.menu,
                  color: Color.fromARGB(255, 8, 8, 8),
                ),
              ],
            ),

            SizedBox(
              height: 50,
              child: Text(
                widget.priority.toString(),
                style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 0),
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: (Color(0xffF9AC66)),
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
            const TodayText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ],
        ),
      ),
    );
  }
}
