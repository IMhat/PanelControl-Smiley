import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management/app/constans/app_constants.dart';
import 'package:project_management/app/shared_components/list_profil_image.dart';
import 'package:project_management/app/utils/helpers/app_helpers.dart';

class TaskCardData {
  final String title;
  final int dueDay;
  final List<ImageProvider> profilContributors;
  final TaskType type;
  final int totalComments;
  final int totalContributors;

  const TaskCardData({
    required this.title,
    required this.dueDay,
    required this.totalComments,
    required this.totalContributors,
    required this.type,
    required this.profilContributors,
  });
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.data,
    required this.onPressedMore,
    required this.onPressedTask,
    required this.onPressedContributors,
    required this.onPressedComments,
    Key? key,
  }) : super(key: key);

  final TaskCardData data;

  final Function() onPressedMore;
  final Function() onPressedTask;
  final Function() onPressedContributors;
  final Function() onPressedComments;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: _Tile(
                dotColor: data.type.getColor(),
                title: data.title,
                subtitle: (data.dueDay < 0)
                    ? "Late in ${data.dueDay * -1} days"
                    : "Due in " +
                        ((data.dueDay > 1) ? "${data.dueDay} days" : "today"),
                onPressedMore: onPressedMore,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpacing),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: data.type.getColor(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: onPressedTask,
                    child: Text(
                      data.type.toStringValue(),
                    ),
                  ),
                  ListProfilImage(
                    images: data.profilContributors,
                    onPressed: onPressedContributors,
                  ),
                ],
              ),
            ),
            const SizedBox(height: kSpacing / 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpacing / 2),
              child: Row(
                children: [
                  _IconButton(
                    iconData: EvaIcons.messageCircleOutline,
                    onPressed: onPressedComments,
                    totalContributors: data.totalComments,
                  ),
                  const SizedBox(width: kSpacing / 2),
                  _IconButton(
                    iconData: EvaIcons.peopleOutline,
                    onPressed: onPressedContributors,
                    totalContributors: data.totalContributors,
                  ),
                ],
              ),
            ),
            const SizedBox(height: kSpacing / 2),
          ],
        ),
      ),
    );
  }
}

/* -----------------------------> COMPONENTS <------------------------------ */
class _Tile extends StatelessWidget {
  const _Tile({
    required this.dotColor,
    required this.title,
    required this.subtitle,
    required this.onPressedMore,
    Key? key,
  }) : super(key: key);

  final Color dotColor;
  final String title;
  final String subtitle;
  final Function() onPressedMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _dot(dotColor),
              const SizedBox(width: 8),
              Expanded(child: _title(title)),
              _moreButton(onPressed: onPressedMore),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _subtitle(subtitle),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _dot(Color color) {
    return CircleAvatar(
      radius: 4,
      backgroundColor: color,
    );
  }

  Widget _title(String data) {
    return Text(
      data,
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _subtitle(String data) {
    return Text(
      data,
      style: Theme.of(Get.context!).textTheme.caption,
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _moreButton({required Function() onPressed}) {
    return IconButton(
      iconSize: 20,
      onPressed: onPressed,
      icon: const Icon(Icons.more_vert_rounded),
      splashRadius: 20,
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.iconData,
    required this.totalContributors,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final IconData iconData;
  final int totalContributors;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
      ),
      onPressed: onPressed,
      icon: _icon(iconData),
      label: _label("$totalContributors"),
    );
  }

  Widget _label(String data) {
    return Text(
      data,
      style: const TextStyle(
        color: Colors.white54,
        fontSize: 10,
      ),
    );
  }

  Widget _icon(IconData iconData) {
    return Icon(
      iconData,
      color: Colors.white54,
      size: 14,
    );
  }
}













// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_management/app/constans/app_constants.dart';
// import 'package:project_management/app/shared_components/list_profil_image.dart';
// import 'package:project_management/app/utils/helpers/app_helpers.dart';

// class TaskCardData {
//   final dynamic title;
//   final dynamic dueDay;
//   final dynamic profilContributors;
//   final dynamic type;
//   final dynamic totalComments;
//   final dynamic totalContributors;
//   final dynamic priority;
//   final dynamic user;
//   final dynamic points;
//   final dynamic done;
//   final dynamic description;

//   const TaskCardData({
//     required this.title,
//     required this.dueDay,
//     required this.totalComments,
//     required this.totalContributors,
//     required this.type,
//     required this.profilContributors,
//     required this.priority,
//     required this.user,
//     required this.points,
//     required this.done,
//     required this.description,
//   });
// }

// class TaskCard extends StatelessWidget {
//   const TaskCard({
//     required this.data,
//     required this.onPressedMore,
//     required this.onPressedTask,
//     required this.onPressedContributors,
//     required this.onPressedComments,
//     Key? key,
//   }) : super(key: key);

//   final TaskCardData data;

//   final Function() onPressedMore;
//   final Function() onPressedTask;
//   final Function() onPressedContributors;
//   final Function() onPressedComments;

//   @override
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
//               child: _Tile(
//                 dotColor: data.type.getColor(),
//                 title: data.title,
//                 subtitle: (data.dueDay < 0)
//                     ? "Late in ${data.dueDay * -1} days"
//                     : "Due in " +
//                         ((data.dueDay > 1) ? "${data.dueDay} days" : "today"),
//                 onPressedMore: onPressedMore,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: kSpacing),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       elevation: 0,
//                       primary: data.type.getColor(),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     onPressed: onPressedTask,
//                     child: Text(
//                       data.type.toStringValue(),
//                     ),
//                   ),
//                   ListProfilImage(
//                     images: data.profilContributors,
//                     onPressed: onPressedContributors,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: kSpacing / 2),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: kSpacing / 2),
//               child: Row(
//                 children: [
//                   _IconButton(
//                     iconData: EvaIcons.messageCircleOutline,
//                     onPressed: onPressedComments,
//                     totalContributors: data.totalComments,
//                   ),
//                   const SizedBox(width: kSpacing / 2),
//                   _IconButton(
//                     iconData: EvaIcons.peopleOutline,
//                     onPressed: onPressedContributors,
//                     totalContributors: data.totalContributors,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: kSpacing / 2),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /* -----------------------------> COMPONENTS <------------------------------ */
// class _Tile extends StatelessWidget {
//   const _Tile({
//     required this.dotColor,
//     required this.title,
//     required this.subtitle,
//     required this.onPressedMore,
//     Key? key,
//   }) : super(key: key);

//   final Color dotColor;
//   final String title;
//   final String subtitle;
//   final Function() onPressedMore;

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
//               _dot(dotColor),
//               const SizedBox(width: 8),
//               Expanded(child: _title(title)),
//               _moreButton(onPressed: onPressedMore),
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


//class TaskCard extends StatelessWidget {
//   final Task task;

//   const TaskCard({
//     Key? key,
//     required this.task,
//     required title,
//     required type,
//     required priority,
//     required description,
//     required user,
//     required points,
//     required done,
//     required dueDay,
//     required profilContributors,
//     required totalComments,
//     required totalContributors,
//   }) : super(key: key);

//   @override
//   //   Widget build(BuildContext context) {
//   //   return Container(
//   //     constraints: const BoxConstraints(maxWidth: 300),
//   //     child: Card(
//   //       shape: RoundedRectangleBorder(
//   //         borderRadius: BorderRadius.circular(kBorderRadius),
//   //       ),
//   //       child: Column(
//   //         crossAxisAlignment: CrossAxisAlignment.start,
//   //         children: [
//   //           Padding(
//   //             padding: const EdgeInsets.all(5),
//   //             child: _Tile(
//   //               dotColor: task.type.getColor(),
//   //               title: task.title,
//   //               subtitle: (task.dueDay < 0)
//   //                   ? "Late in ${task.dueDay * -1} days"
//   //                   : "Due in " +
//   //                       ((task.dueDay > 1) ? "${task.dueDay} days" : "today"),
//   //               onPressedMore: onPressedMore,
//   //             ),
//   //           ),
//   //           Padding(
//   //             padding: const EdgeInsets.symmetric(horizontal: kSpacing),
//   //             child: Row(
//   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //               children: [
//   //                 ElevatedButton(
//   //                   style: ElevatedButton.styleFrom(
//   //                     elevation: 0,
//   //                     primary: task.type.getColor(),
//   //                     shape: RoundedRectangleBorder(
//   //                       borderRadius: BorderRadius.circular(30),
//   //                     ),
//   //                   ),
//   //                   onPressed: onPressedTask,
//   //                   child: Text(
//   //                     task.type,
//   //                   ),
//   //                 ),
//   //                 ListProfilImage(
//   //                   images: task.profilContributors,
//   //                   onPressed: onPressedContributors,
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //           const SizedBox(height: kSpacing / 2),
//   //           Padding(
//   //             padding: const EdgeInsets.symmetric(horizontal: kSpacing / 2),
//   //             child: Row(
//   //               children: [
//   //                 _IconButton(
//   //                   iconData: EvaIcons.messageCircleOutline,
//   //                   onPressed: onPressedComments,
//   //                   totalContributors: task.totalComments,
//   //                 ),
//   //                 const SizedBox(width: kSpacing / 2),
//   //                 _IconButton(
//   //                   iconData: EvaIcons.peopleOutline,
//   //                   onPressed: onPressedContributors,
//   //                   totalContributors: task.totalContributors,
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //           const SizedBox(height: kSpacing / 2),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

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
//             description: task.description,
//             type: task.type,
//             priority: task.priority,
//             points: task.points,
//             user: task.user,
//             dueDay: task.dueDay,
//             profilContributors: task.profilContributors,
//             totalComments: task.totalComments,
//             totalContributors: task.totalContributors,
//             done: task.done,
//             onPressedComments: () {},
//             onPressedContributors: () {},
//             onPressedMore: () {},
//             onPressedTask: () {},
//             data: task,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _TaskDetails extends StatefulWidget {
//   final String title;
//   final dynamic type;
//   final String? priority;
//   final String? description;
//   final String? user;
//   final String? points;
//   final dynamic dueDay;
//   final dynamic profilContributors;
//   final dynamic totalComments;
//   final dynamic totalContributors;
//   final String? done;
//   // final String? subTitle;

//   const _TaskDetails({
//     required this.title,
//     required this.type,
//     this.priority,
//     this.user,
//     this.description,
//     this.points,
//     this.dueDay,
//     required this.profilContributors,
//     this.totalComments,
//     this.totalContributors,
//     this.done,
//     // this.subTitle,
//     required this.data,
//     required this.onPressedMore,
//     required this.onPressedTask,
//     required this.onPressedContributors,
//     required this.onPressedComments,
//     Key? key,
//   }) : super(key: key);

//   final Task data;

//   final Function() onPressedMore;
//   final Function() onPressedTask;
//   final Function() onPressedContributors;
//   final Function() onPressedComments;

//   // const _TaskDetails({this.title, this.subTitle});

//   @override
//   State<_TaskDetails> createState() => _TaskDetailsState();
// }

// class _TaskDetailsState extends State<_TaskDetails> {
//   @override
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
//               child: _Tile(
//                 dotColor: widget.type.getColor(),
//                 title: widget.title,
//                 subtitle: (widget.dueDay < 0)
//                     ? "Late in ${widget.dueDay * -1} days"
//                     : "Due in " +
//                         ((widget.dueDay > 1)
//                             ? "${widget.dueDay} days"
//                             : "today"),
//                 onPressedMore: widget.onPressedMore,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: kSpacing),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       elevation: 0,
//                       primary: widget.type.getColor(),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     onPressed: widget.onPressedTask,
//                     child: Text(
//                       widget.type.toStringValue(),
//                     ),
//                   ),
//                   ListProfilImage(
//                     images: widget.profilContributors,
//                     onPressed: widget.onPressedContributors,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: kSpacing / 2),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: kSpacing / 2),
//               child: Row(
//                 children: [
//                   _IconButton(
//                     iconData: EvaIcons.messageCircleOutline,
//                     onPressed: widget.onPressedComments,
//                     totalContributors: widget.totalComments,
//                   ),
//                   const SizedBox(width: kSpacing / 2),
//                   _IconButton(
//                     iconData: EvaIcons.peopleOutline,
//                     onPressed: widget.onPressedContributors,
//                     totalContributors: widget.totalContributors,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: kSpacing / 2),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /* -----------------------------> COMPONENTS <------------------------------ */
// class _Tile extends StatelessWidget {
//   const _Tile({
//     required this.dotColor,
//     required this.title,
//     required this.subtitle,
//     required this.onPressedMore,
//     Key? key,
//   }) : super(key: key);

//   final Color dotColor;
//   final String title;
//   final String subtitle;
//   final Function() onPressedMore;

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
//               _dot(dotColor),
//               const SizedBox(width: 8),
//               Expanded(child: _title(title)),
//               _moreButton(onPressed: onPressedMore),
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

