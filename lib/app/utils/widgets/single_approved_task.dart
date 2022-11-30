import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_management/app/constans/app_constants.dart';
import 'package:project_management/app/features/dashboard/models/task_approved.dart';


class SingleApprovedTask extends StatelessWidget {
  final TaskApproved task;

  const SingleApprovedTask({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime.parse(task.startDate);
    DateTime endDate = DateTime.parse(task.endDate);

    String ymdStartDate = DateFormat('dd/MM/yyyy').format(startDate);
    String ymdEndDate = DateFormat('dd/MM/yyyy').format(endDate);

    String hmStartDate = DateFormat('HH:mm aa').format(startDate);
    String hmEndDate = DateFormat('HH:mm aa').format(endDate);

    return Container(
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.only(top: 2),
      width: 400, height: 180,
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
            ymdStartDate: ymdStartDate =
                DateFormat('dd/MM/yyyy').format(startDate),
            ymdEndDate: ymdEndDate = DateFormat('dd/MM/yyyy').format(endDate),

            hmStartDate: hmStartDate = DateFormat('HH:mm aa').format(startDate),
            hmEndDate: hmEndDate = DateFormat('HH:mm aa').format(endDate),
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
  final String? ymdStartDate;
  final String? ymdEndDate;
  final String? hmStartDate;
  final String? hmEndDate;
  //final String? subTitle;

  const _TaskDetails({
    this.title,
    this.type,
    this.priority,
    this.ymdStartDate,
    this.ymdEndDate,
    this.hmStartDate,
    this.hmEndDate,
  });

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
        width: 250,
        height: 180,
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
                SizedBox(
                  width: 150,
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
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
            SizedBox(
              height: 30,
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
                  padding: const EdgeInsets.all(3.0),
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 63, 165, 58),
                      border: Border.all(
                          color: const Color.fromARGB(255, 255, 251, 251)),
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    widget.type.toString(),
                    style: const TextStyle(
                        fontSize: 13,
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
            Text(
              '${widget.ymdStartDate} - ${widget.hmStartDate}',
              style: const TextStyle(
                  fontSize: 13, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            Text(
              "${widget.ymdEndDate} - ${widget.hmEndDate}",
              style: const TextStyle(
                  fontSize: 13, color: Color.fromARGB(255, 255, 0, 0)),
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
