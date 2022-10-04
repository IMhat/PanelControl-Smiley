import 'package:get/get.dart';
import 'package:project_management/app/constans/app_constants.dart';
import 'package:project_management/app/features/dashboard/views/screens/dashboard_screen.dart';

import '../../../../shared_components/responsive_builder.dart';
import '../../../../utils/services/task_services.dart';
import '../../models/task_model.dart';

import '../ui/input_decorations.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskPostScreen extends StatefulWidget {
  static const String route = '/taskPost';
  const TaskPostScreen({Key? key}) : super(key: key);

  @override
  State<TaskPostScreen> createState() => _TaskPostScreenState();
}

class _TaskPostScreenState extends State<TaskPostScreen> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _userController = TextEditingController();

  final TextEditingController _pointsController = TextEditingController();

  // final TextEditingController _doneController = TextEditingController();
  final TextEditingController _dueController = TextEditingController();

  // final TextEditingController _comentsController = TextEditingController();
  final TextEditingController _createdByController = TextEditingController();

  late TaskModel taskModel;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // var _lista = ['To do', 'In progress', 'Done'];
  // String _vista = 'Seleccione un estado';
  @override
  Widget build(BuildContext context) {
    final taskServiceProvider =
        Provider.of<TaskService>(context, listen: false);
    // final taskForm = Provider.of<TaskFormProvider>(context);
    //final task = taskForm.task;

    return Scaffold(
      drawer: (ResponsiveBuilder.isDesktop(context))
          ? null
          : const Drawer(
              child: Padding(
                padding: EdgeInsets.only(top: kSpacing),
              ),
            ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Nueva Tarea'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 500),
              width: 800,
              height: 90,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                    width: 280,
                    height: 40,
                    // decoration: BoxDecoration(
                    //     border: Border.all(
                    //         color: const Color.fromARGB(255, 0, 21, 255)),
                    //     borderRadius: BorderRadius.circular(10)),
                    // child: OutlinedButton.icon(
                    //     onPressed: () {},
                    //     icon: const Icon(Icons.check),
                    //     label: const Text("Marcar como finalizada"))
                  ),
                  Container(
                    width: 300,
                    height: 60,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.emoji_people,
                              color: Colors.black,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.attach_file,
                              color: Colors.black,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share_rounded,
                              color: Colors.black,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.link_sharp,
                              color: Colors.black,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.black,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 500),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: 800,
              height: 700,
              decoration: _buildBoxDecoration(),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                        controller: _tituloController,
                        decoration: const InputDecoration(
                            hintText: 'Titulo de la tarea',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(74, 177, 120, 1)),
                            labelText: 'Titulo',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator: (dynamic dato) {
                          if (dato!.isEmpty) {
                            return 'Este campo es requerido';
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      // Container(
                      //   child: DropdownButton(
                      //     items: _lista.map((String a) {
                      //       return DropdownMenuItem(value: a, child: Text(a));
                      //     }).toList(),
                      //     onChanged: (_value) => {
                      //       setState(() {
                      //         _vista = _value.toString();
                      //       })
                      //     },
                      //     hint: Text(
                      //       _vista,
                      //       style: TextStyle(color: Colors.black),
                      //     ),
                      //   ),
                      // ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                        controller: _typeController,
                        decoration: const InputDecoration(
                            hintText: 'Estado de la tarea',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(74, 177, 120, 1)),
                            labelText: 'Estado',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator: (dynamic dato) {
                          if (dato!.isEmpty) {
                            return 'Este campo es requerido';
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                        controller: _priorityController,
                        decoration: const InputDecoration(
                            hintText: 'Prioridad de la tarea',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(74, 177, 120, 1)),
                            labelText: 'Prioridad',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator: (dynamic dato) {
                          if (dato!.isEmpty) {
                            return 'Este campo es requerido';
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                        controller: _createdByController,
                        decoration: const InputDecoration(
                            hintText: 'createdBy',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(74, 177, 120, 1)),
                            labelText: 'createdBy',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator: (dynamic dato) {
                          if (dato!.isEmpty) {
                            return 'Este campo es requerido';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0)),
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                              hintText: 'Descripción de la tarea',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(74, 177, 120, 1)),
                              labelText: 'Descripción',
                              labelStyle: TextStyle(color: Colors.black)),
                          validator: (dynamic dato) {
                            if (dato!.isEmpty) {
                              return 'Este campo es requerido';
                            }
                          }),
                      const SizedBox(height: 30),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0)),
                          controller: _userController,
                          decoration: const InputDecoration(
                              hintText: 'Usuario asignado',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(74, 177, 120, 1)),
                              labelText: 'Asignación',
                              labelStyle: TextStyle(color: Colors.black)),
                          validator: (dynamic dato) {
                            if (dato!.isEmpty) {
                              return 'Este campo es requerido';
                            }
                          }),
                      const SizedBox(height: 30),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0)),
                          controller: _pointsController,
                          decoration: const InputDecoration(
                              hintText: 'Puntos de la tarea',
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(74, 177, 120, 1)),
                              labelText: 'Puntos',
                              labelStyle: TextStyle(color: Colors.black)),
                          validator: (dynamic dato) {
                            if (dato!.isEmpty) {
                              return 'Este campo es requerido';
                            }
                          }),
                      const SizedBox(height: 30),
                      // TextFormField(
                      //     keyboardType: TextInputType.number,
                      //     style: const TextStyle(
                      //         color: Color.fromARGB(255, 0, 0, 0)),
                      //     controller: _dueController,
                      //     decoration: const InputDecoration(
                      //         hintText: 'Lapso de tiempo',
                      //         hintStyle: TextStyle(
                      //             color: Color.fromRGBO(74, 177, 120, 1)),
                      //         labelText: 'Tiempo',
                      //         labelStyle: TextStyle(color: Colors.black)),
                      //     validator: (dynamic dato) {
                      //       if (dato!.isEmpty) {
                      //         return 'Este campo es requerido';
                      //       }
                      //     }),
                    ],
                  )),
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 10, left: 500),
            //   width: 800,
            //   height: 100,
            //   decoration: _buildBoxDecoration(),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: const [
            //       CircleAvatar(
            //         backgroundImage: AssetImage(ImageRasterPath.avatar4),
            //       ),
            //       Text(
            //         "Mariano creó esta tarea",
            //         style: TextStyle(color: Colors.black, fontSize: 20),
            //       ),
            //       Text(
            //         "Ayer a las 4:33",
            //         style: TextStyle(color: Colors.grey),
            //       )
            //     ],
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(top: 10, left: 500),
            //   width: 800,
            //   height: 150,
            //   decoration: _buildBoxDecoration(),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       const CircleAvatar(
            //         backgroundImage: AssetImage(ImageRasterPath.avatar4),
            //       ),
            //       Container(
            //         width: 500,
            //         height: 100,
            //         decoration: BoxDecoration(
            //             border: Border.all(
            //                 color: const Color.fromARGB(255, 0, 21, 255)),
            //             borderRadius: BorderRadius.circular(10)),
            //         child: Container(
            //           padding: const EdgeInsets.only(left: 10, right: 10),
            //           child: TextFormField(
            //             style: const TextStyle(
            //                 color: Color.fromARGB(255, 0, 0, 0)),
            //             controller: _comentsController,
            //             decoration: const InputDecoration(
            //                 hintText: 'Comentarios',
            //                 hintStyle: TextStyle(
            //                     color: Color.fromRGBO(74, 177, 120, 1)),
            //                 labelText: 'Agrega un comentario',
            //                 labelStyle: TextStyle(color: Colors.black)),
            //             validator: (String? dato) {
            //               if (dato!.isEmpty) {
            //                 return 'Este campo es requerido';
            //               }
            //             },
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save_outlined),
          onPressed: () async {
            // if (_formKey.currentState!.validate()) {
            await TaskService().saveTasks(
              _tituloController.text,
              _typeController.text,
              _priorityController.text,
              _descriptionController.text,
              _userController.text,
              _pointsController.text,
              _dueController.text,
              _createdByController.text,
              // _doneController.text,
            );
            // final taskListProvider =
            //     Provider.of<TaskListProvider>(context, listen: false);
            // taskListProvider.nuevaTask(
            //     _tituloController.text, _descriptionController.text);
            //}
            taskServiceProvider.tasks = [];
            taskServiceProvider.loadTasks();
            Navigator.of(context).pushNamed(DashboardScreen.route);
          }),
    );
  }
}

BoxDecoration _buildBoxDecoration() => const BoxDecoration(
      color: Color.fromARGB(255, 237, 230, 230),
    );
