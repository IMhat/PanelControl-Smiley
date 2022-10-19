import 'package:flutter/material.dart';
import '../../constans/app_constants.dart';
import '../../features/dashboard/models/task.dart';
import '../../shared_components/today_text.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),

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
            type: task.type,
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
        margin: EdgeInsets.only(left: 3, top: 3),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: 250,
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
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),

            SizedBox(
              height: 50,
              child: Text(
                widget.priority.toString(),
                style: const TextStyle(
                    fontSize: 12,
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
                      color: (Color(0xffED6B5B)),
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
            TodayText()
          ],
        ),
      ),
    );
  }
}


// /* -----------------------------> COMPONENTS <------------------------------ */
// class _Tile extends StatelessWidget {
//   const _Tile({
//     // required this.dotColor,
//     required this.title,
//     required this.subtitle,
//     // required this.onPressedMore,
//     Key? key,
//   }) : super(key: key);

//   // final Color dotColor;
//   final String title;
//   final String subtitle;
//   // final Function() onPressedMore;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 16),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               // _dot(dotColor),
//               const SizedBox(width: 8),
//               Expanded(child: _title(title)),
//               // _moreButton(onPressed: onPressedMore),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: _subtitle(subtitle),
//         ),
//         const SizedBox(height: 12),
//       ],
//     );
//   }

//   Widget _dot(Color color) {
//     return CircleAvatar(
//       radius: 4,
//       backgroundColor: color,
//     );
//   }

//   Widget _title(String data) {
//     return Text(
//       data,
//       textAlign: TextAlign.left,
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//     );
//   }

//   Widget _subtitle(String data) {
//     return Text(
//       data,
//       style: Theme.of(Get.context!).textTheme.caption,
//       textAlign: TextAlign.left,
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//     );
//   }

//   Widget _moreButton({required Function() onPressed}) {
//     return IconButton(
//       iconSize: 20,
//       onPressed: onPressed,
//       icon: const Icon(Icons.more_vert_rounded),
//       splashRadius: 20,
//     );
//   }
// }

// class _IconButton extends StatelessWidget {
//   const _IconButton({
//     required this.iconData,
//     required this.totalContributors,
//     required this.onPressed,
//     Key? key,
//   }) : super(key: key);

//   final IconData iconData;
//   final int totalContributors;
//   final Function() onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton.icon(
//       style: ElevatedButton.styleFrom(
//         primary: Colors.transparent,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(kBorderRadius),
//         ),
//       ),
//       onPressed: onPressed,
//       icon: _icon(iconData),
//       label: _label("$totalContributors"),
//     );
//   }

//   Widget _label(String data) {
//     return Text(
//       data,
//       style: const TextStyle(
//         color: Colors.white54,
//         fontSize: 10,
//       ),
//     );
//   }

//   Widget _icon(IconData iconData) {
//     return Icon(
//       iconData,
//       color: Colors.white54,
//       size: 14,
//     );
//   }
// }






  


