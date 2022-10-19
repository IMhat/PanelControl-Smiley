
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class NewTask extends StatefulWidget {
//   const NewTask();

//   @override
//   State<NewTask> createState() => _NewTaskState();
// }

// class _NewTaskState extends State<NewTask> {
//   @override
//   Widget build(BuildContext context) {
//     // The GestureDetector wraps the button.
//     return GestureDetector(
//       // When the child is tapped, show a snackbar.
//       onTap: () {
//         showDialog(
//             context: context,
//             builder: (context) {
//               return const _NewTaskDialog();
//             });
//         // Navigator.pushNamed(
//         //   context,
//         //   '',
//         // );
//       },
//       // The custom button
//       child: Container(
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
//           'Filter',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

// class _NewTaskDialog extends StatelessWidget {
//   const _NewTaskDialog({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var _lista = ['To do', 'In progress', 'Done'];
//     String _vista = 'Seleccione un miembro';
//     return AlertDialog(
//       content: Container(
//         color: Colors.white,
//         width: MediaQuery.of(context).size.width * .2,
//         height: MediaQuery.of(context).size.height * .8,
//         child: Column(
//           children: [
//             Text(
//               "Filtrar",
//               style: TextStyle(color: Colors.black),
//               textAlign: TextAlign.start,
//             ),
//             Divider(indent: 2, color: Colors.grey),
//             Container(
//               decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 87, 86, 86),
//                   borderRadius: BorderRadius.all(Radius.circular(8))),
//               child: const TextField(
//                 controller: null,
//                 decoration: InputDecoration(
//                   hintText: "Search tasks",
//                   hintStyle: TextStyle(color: Colors.black, fontSize: 15),
//                   icon: Icon(Icons.search, color: Colors.black),
//                   suffixIcon: Icon(
//                     Icons.file_download_outlined,
//                     size: 20.00,
//                   ),
//                 ),
//               ),
//             ),
//             Text(
//               "Miembros",
//               style: TextStyle(color: Colors.black),
//               textAlign: TextAlign.start,
//             ),
//             Container(
//               child: DropdownButton(
//                 items: _lista.map((String a) {
//                   return DropdownMenuItem(
//                       value: a,
//                       child: Text(
//                         a,
//                         style: TextStyle(color: Colors.black),
//                       ));
//                 }).toList(),
//                 onChanged: (_value) => {
//                   setState(() {
//                     _vista = _value.toString();
//                   })
//                 },
//                 hint: Text(
//                   _vista,
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   setState(Function() param0) {}
// }