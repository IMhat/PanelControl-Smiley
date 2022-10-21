// import 'dart:ui';

// import 'package:get/get.dart';
// import 'package:project_management/app/constans/app_constants.dart';
// import 'package:project_management/app/features/dashboard/models/tasks.dart';
// import 'package:project_management/app/features/dashboard/views/screens/dashboard_screen.dart';

// import '../../../../shared_components/responsive_builder.dart';

// import '../../../../utils/widgets/bar_post_task.dart';


// import '../ui/input_decorations.dart';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class TaskPostScreen extends StatefulWidget {
//   static const String route = '/taskPost';
//   const TaskPostScreen({Key? key}) : super(key: key);

//   @override
//   State<TaskPostScreen> createState() => _TaskPostScreenState();
// }

// class _TaskPostScreenState extends State<TaskPostScreen> {
//   final TextEditingController _tituloController = TextEditingController();
//   final TextEditingController _typeController = TextEditingController();
//   final TextEditingController _priorityController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _userController = TextEditingController();

//   final TextEditingController _pointsController = TextEditingController();

//   // final TextEditingController _doneController = TextEditingController();
//   final TextEditingController _dueController = TextEditingController();

//   // final TextEditingController _comentsController = TextEditingController();
//   final TextEditingController _createdByController = TextEditingController();

//   late Task taskModel;

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   // var _lista = ['To do', 'In progress', 'Done'];
//   // String _vista = 'Seleccione un estado';
//   final decoration = const BoxDecoration(
//       color: Color.fromARGB(255, 255, 255, 255),
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(10),
//           topRight: Radius.circular(10),
//           bottomLeft: Radius.circular(10),
//           bottomRight: Radius.circular(10)));
//   @override
//   Widget build(BuildContext context) {

//     // final taskForm = Provider.of<TaskFormProvider>(context);
//     //final task = taskForm.task;

//     return Scaffold(
//       drawer: (ResponsiveBuilder.isDesktop(context))
//           ? null
//           : const Drawer(
//               child: Padding(
//                 padding: EdgeInsets.only(top: kSpacing),
//               ),
//             ),
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Nueva Tarea'),
//       ),
//       body: SingleChildScrollView(
//         child: Wrap(children: [
//           Column(
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 500),
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 width: 800,
//                 height: 900,
//                 decoration: _buildBoxDecoration(),
//                 child: Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 10),
//                         Container(
//                           margin: const EdgeInsets.only(right: 200),
//                           padding: const EdgeInsets.all(5.0),
//                           width: 300,
//                           child: TextFormField(
//                             keyboardType: TextInputType.number,
//                             style: const TextStyle(
//                                 color: Color.fromARGB(255, 0, 0, 0)),
//                             controller: _tituloController,
//                             decoration: const InputDecoration(
//                                 hintText: 'Titulo de la tarea',
//                                 hintStyle: TextStyle(
//                                     color: Color.fromARGB(255, 0, 0, 0)),
//                                 labelText: 'Titulo de la tarea',
//                                 labelStyle: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.w600)),
//                             validator: (dynamic dato) {
//                               if (dato!.isEmpty) {
//                                 return 'Este campo es requerido';
//                               }
//                             },
//                           ),
//                         ),
//                         Container(
//                           margin: const EdgeInsets.only(right: 250),
//                           width: 200,
//                           child: TextFormField(
//                             keyboardType: TextInputType.number,
//                             style: const TextStyle(
//                                 color: Color.fromARGB(255, 0, 0, 0)),
//                             controller: _typeController,
//                             decoration: const InputDecoration(
//                                 hintText: 'Estado de la tarea',
//                                 hintStyle: TextStyle(
//                                     color: Color.fromRGBO(74, 177, 120, 1)),
//                                 labelText: 'En Estado',
//                                 labelStyle: TextStyle(color: Colors.black)),
//                             validator: (dynamic dato) {
//                               if (dato!.isEmpty) {
//                                 return 'Este campo es requerido';
//                               }
//                             },
//                           ),
//                         ),
//                         Container(
//                           margin: const EdgeInsets.only(right: 250),
//                           padding: const EdgeInsets.all(9.0),
//                           width: 200,
//                           height: 50,
//                           child: TextFormField(
//                               keyboardType: TextInputType.number,
//                               style: const TextStyle(
//                                   color: Color.fromARGB(255, 0, 0, 0)),
//                               controller: _userController,
//                               decoration: const InputDecoration(
//                                   // hintText: 'Usuario asignado',
//                                   hintStyle: TextStyle(
//                                       color: Color.fromARGB(255, 0, 0, 0)),
//                                   labelText: 'Colaborador',
//                                   labelStyle: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w600)),
//                               validator: (dynamic dato) {
//                                 if (dato!.isEmpty) {
//                                   return 'Este campo es requerido';
//                                 }
//                               }),
//                         ),
//                         Wrap(children: [
//                           Container(
//                             child: const CircleAvatar(
//                               radius: 25.0,
//                               backgroundColor:
//                                   Color.fromARGB(255, 211, 211, 211),
//                               backgroundImage: AssetImage(
//                                   'assets/images/raster/avatar-1.png'),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 3,
//                           ),
//                           Container(
//                             width: 50,
//                             height: 50,
//                             decoration: BoxDecoration(
//                                 color: const Color.fromARGB(255, 228, 226, 226),
//                                 borderRadius: BorderRadius.circular(50)),
//                             child: IconButton(
//                               onPressed: (() {}),
//                               icon: const Icon(Icons.add),
//                               color: Colors.black,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Container(
//                               width: 150,
//                               height: 50,
//                               decoration: BoxDecoration(
//                                   color:
//                                       const Color.fromARGB(255, 229, 168, 168),
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: TextButton(
//                                   onPressed: () {},
//                                   child: const Text(
//                                     "Etiqueta",
//                                     style: const TextStyle(color: Colors.black),
//                                   ))),
//                           const SizedBox(
//                             width: 3,
//                           ),
//                           Container(
//                             margin: const EdgeInsets.only(right: 150),
//                             width: 50,
//                             height: 50,
//                             decoration: BoxDecoration(
//                                 color: const Color.fromARGB(255, 228, 226, 226),
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: IconButton(
//                               onPressed: (() {}),
//                               icon: const Icon(Icons.add),
//                               color: Colors.black,
//                             ),
//                           ),
//                         ]),
//                         const SizedBox(height: 20),
//                         Column(
//                           children: [
//                             Container(
//                               margin: const EdgeInsets.only(right: 400),
//                               child: const Text("Descripción",
//                                   style: TextStyle(
//                                       fontSize: 20, color: Colors.black)),
//                             ),
//                             Container(
//                               margin: const EdgeInsets.only(left: 80),
//                               padding: const EdgeInsets.all(5.0),
//                               width: 650,
//                               height: 60,
//                               decoration: BoxDecoration(
//                                   color:
//                                       const Color.fromARGB(255, 239, 239, 239),
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: TextFormField(
//                                   keyboardType: TextInputType.number,
//                                   style: const TextStyle(
//                                       color: Color.fromARGB(255, 0, 0, 0)),
//                                   controller: _descriptionController,
//                                   decoration: const InputDecoration(
//                                       // hintText: 'Descripción de la tarea',
//                                       hintStyle: TextStyle(
//                                           color: Color.fromARGB(255, 0, 0, 0)),
//                                       labelText: 'Añadir una descripción',
//                                       labelStyle:
//                                           TextStyle(color: Colors.black)),
//                                   validator: (dynamic dato) {
//                                     if (dato!.isEmpty) {
//                                       return 'Este campo es requerido';
//                                     }
//                                   }),
//                             ),
//                           ],
//                         ),
//                         Wrap(
//                           children: [
//                             Container(
//                               margin: const EdgeInsets.only(right: 200),
//                               child: const Text(
//                                 "Actividad",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ),
//                             Container(
//                               width: 200,
//                               height: 50,
//                               child: TextButton(
//                                   onPressed: (() {}),
//                                   child: Text(
//                                     "Mostrar detalles",
//                                     style: TextStyle(color: Colors.black),
//                                   )),
//                             )
//                           ],
//                         ),
//                         const SizedBox(width: 5),
//                         Container(
//                           margin: const EdgeInsets.only(left: 80),
//                           padding: const EdgeInsets.all(5.0),
//                           width: 650,
//                           height: 60,
//                           decoration: BoxDecoration(
//                               color: const Color.fromARGB(255, 239, 239, 239),
//                               borderRadius: BorderRadius.circular(10)),
//                           child: TextFormField(
//                             keyboardType: TextInputType.number,
//                             style: const TextStyle(
//                                 color: Color.fromARGB(255, 0, 0, 0)),
//                             controller: _createdByController,
//                             decoration: const InputDecoration(
//                                 // hintText: 'Actividad',
//                                 hintStyle: TextStyle(
//                                     color: Color.fromARGB(255, 0, 0, 0)),
//                                 labelText: 'Escriba un comentario',
//                                 labelStyle: TextStyle(color: Colors.black)),
//                             validator: (dynamic dato) {
//                               if (dato!.isEmpty) {
//                                 return 'Este campo es requerido';
//                               }
//                             },
//                           ),
//                         ),
//                         Container(
//                           height: 100,
//                           width: 150,
//                           padding: const EdgeInsets.all(5.0),
//                           child: TextFormField(
//                             keyboardType: TextInputType.number,
//                             style: const TextStyle(
//                                 color: Color.fromARGB(255, 0, 0, 0)),
//                             controller: _priorityController,
//                             decoration: const InputDecoration(
//                                 hintText: 'Prioridad de la tarea',
//                                 hintStyle: TextStyle(
//                                     color: Color.fromARGB(255, 0, 0, 0)),
//                                 labelText: 'Prioridad',
//                                 labelStyle: TextStyle(
//                                     color: Colors.black, fontSize: 2)),
//                             validator: (dynamic dato) {
//                               if (dato!.isEmpty) {
//                                 return 'Este campo es requerido';
//                               }
//                             },
//                           ),
//                         ),
//                         const SizedBox(height: 30),
//                         TextButton(
//                             onPressed: (() async {
//                               // if (_formKey.currentState!.validate()) {
//                               await TaskService().saveTasks(
//                                 _tituloController.text,
//                                 _typeController.text,
//                                 _priorityController.text,
//                                 _descriptionController.text,
//                                 _userController.text,
//                                 _pointsController.text,
//                                 _dueController.text,
//                                 _createdByController.text,
//                                 // _doneController.text,
//                               );
//                               // final taskListProvider =
//                               //     Provider.of<TaskListProvider>(context, listen: false);
//                               // taskListProvider.nuevaTask(
//                               //     _tituloController.text, _descriptionController.text);
//                               //}
//                               taskServiceProvider.tasks = [];
//                               taskServiceProvider.loadTasks();
//                               Navigator.of(context)
//                                   .pushNamed(DashboardScreen.route);
//                             }),
//                             child: Container(
//                               padding: const EdgeInsets.all(8.0),
//                               width: 150,
//                               height: 40,
//                               decoration: BoxDecoration(
//                                 gradient: const LinearGradient(
//                                     begin: AlignmentDirectional.topEnd,
//                                     colors: [
//                                       Color.fromARGB(255, 242, 133, 157),
//                                       Color.fromARGB(255, 167, 79, 211),
//                                     ]),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: const Text(
//                                 "Crear Tarea",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             )),
//                       ],
//                     )),
//               ),
//               const SizedBox(
//                 height: 100,
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: const EdgeInsets.all(5.0),
//                 width: 200,
//                 height: 50,
//                 decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 240, 238, 238),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: TextFormField(
//                     keyboardType: TextInputType.number,
//                     style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
//                     controller: _pointsController,
//                     decoration: const InputDecoration(
//                         // hintText: 'Puntos de la tarea',
//                         hintStyle:
//                             TextStyle(color: Color.fromRGBO(74, 177, 120, 1)),
//                         labelText: 'Puntos',
//                         labelStyle: TextStyle(color: Colors.black)),
//                     validator: (dynamic dato) {
//                       if (dato!.isEmpty) {
//                         return 'Este campo es requerido';
//                       }
//                     }),
//               ),
//               const BarPost(),
//             ],
//           ),
//         ]),
//       ),

//       // floatingActionButton: FloatingActionButton(
//       //     child: const Icon(Icons.save_outlined),
//       //     onPressed: () async {
//       //       // if (_formKey.currentState!.validate()) {
//       //       await TaskService().saveTasks(
//       //         _tituloController.text,
//       //         _typeController.text,
//       //         _priorityController.text,
//       //         _descriptionController.text,
//       //         _userController.text,
//       //         _pointsController.text,
//       //         _dueController.text,
//       //         _createdByController.text,
//       //         // _doneController.text,
//       //       );
//       //       // final taskListProvider =
//       //       //     Provider.of<TaskListProvider>(context, listen: false);
//       //       // taskListProvider.nuevaTask(
//       //       //     _tituloController.text, _descriptionController.text);
//       //       //}
//       //       taskServiceProvider.tasks = [];
//       //       taskServiceProvider.loadTasks();
//       //       Navigator.of(context).pushNamed(DashboardScreen.route);
//       //     }),
//     );
//   }
// }

// BoxDecoration _buildBoxDecoration() => const BoxDecoration(
//       color: Color.fromARGB(255, 255, 255, 255),
//     );
