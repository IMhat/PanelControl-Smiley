import 'package:flutter/material.dart';
import '../../constans/app_constants.dart';
import '../../features/dashboard/models/task.dart';


class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({Key? key, required this.task}) : super(key: key);

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
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: const BoxConstraints(maxWidth: 300),
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(kBorderRadius),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(5),
//               child: _TaskDetails(
//                 // title: taskListProvider.tasks[i].title,
//                 // subTitle: taskListProvider.tasks[i].description,
//                 title: task.title,
//                 subTitle: task.description,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: kSpacing),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // ElevatedButton(
//                   //   style: ElevatedButton.styleFrom(
//                   //     elevation: 0,
//                   //     primary: task.type.getColor(),
//                   //     shape: RoundedRectangleBorder(
//                   //       borderRadius: BorderRadius.circular(30),
//                   //     ),
//                   //   ),
//                   //   onPressed: onPressedTask,
//                   //   child: Text(
//                   //     task.type.toStringValue(),
//                   //   ),
//                   // ),
//                   // ListProfilImage(
//                   //   images: task.profilContributors,
//                   //   onPressed: onPressedContributors,
//                   // ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: kSpacing / 2),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: kSpacing / 2),
//               child: Row(
//                 children: [
//                   // _IconButton(
//                   //   iconData: EvaIcons.messageCircleOutline,
//                   //   onPressed: onPressedComments,
//                   //   totalContributors: task.totalComments,
//                   // ),
//                   const SizedBox(width: kSpacing / 2),
//                   // _IconButton(
//                   //   iconData: EvaIcons.peopleOutline,
//                   //   onPressed: onPressedContributors,
//                   //   totalContributors: task.totalContributors,
//                   // ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: kSpacing / 2),
//           ],
//         ),

//       ),

//             floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () => Navigator.pushNamed(context, 'usersPost'),
//       )

//     );

//   }
// }

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
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                          color: const Color.fromARGB(255, 255, 251, 251)),
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    widget.type.toString(),
                    style: const TextStyle(
                        fontSize: 18,
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
              // children: [
              //   ElevatedButton(
              //     style: elevatedButtonStyle,
              //     onPressed: () {
              //       Navigator.pushNamed(
              //         context,
              //         'TaskDetail',
              //       );
              //     },
              //     child: const Text("Ver"),
              //   ),
              //   ElevatedButton(
              //     style: elevatedButtonStyle,
              //     onPressed: () {
              //       Navigator.pushNamed(
              //         context,
              //         'tasksPost',
              //       );
              //     },
              //     child: const Text("Empezar"),
              //   ),
              // ],
            ),
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






  


