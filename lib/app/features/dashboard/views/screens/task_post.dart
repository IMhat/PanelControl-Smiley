import 'package:project_management/app/features/dashboard/views/screens/dashboard_screen.dart';

import '../../../../utils/services/task_services.dart';
import '../../models/task_model.dart';
import '../../providers/task_form_provider.dart';
import '../../providers/task_list_provider.dart';
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
  final TextEditingController _doneController = TextEditingController();
  final TextEditingController _dueDayController = TextEditingController();

  late TaskModel taskModel;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final taskServiceProvider =
        Provider.of<TaskService>(context, listen: false);
    final scanListProvider =
        Provider.of<TaskListProvider>(context, listen: false);
    // final taskForm = Provider.of<TaskFormProvider>(context);
    //final task = taskForm.task;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Nueva Tarea'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 800,
              decoration: _buildBoxDecoration(),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _tituloController,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: 'Titulo de la tarea',
                            labelText: 'Titulo'),
                        validator: (String? dato) {
                          if (dato!.isEmpty) {
                            return 'Este campo es requerido';
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _typeController,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: 'Estado de Tarea', labelText: 'Estado'),
                        validator: (String? dato) {
                          if (dato!.isEmpty) {
                            return 'Este campo es requerido';
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _priorityController,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: 'Prioridad de la Tarea',
                            labelText: 'Prioridad'),
                        validator: (String? dato) {
                          if (dato!.isEmpty) {
                            return 'Este campo es requerido';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                          controller: _descriptionController,
                          decoration: InputDecorations.authInputDecoration(
                              hintText: 'Descripcion de la tarea',
                              labelText: 'Descripcion'),
                          validator: (String? dato) {
                            if (dato!.isEmpty) {
                              return 'Este campo es requerido';
                            }
                          }),
                      const SizedBox(height: 30),
                      TextFormField(
                          controller: _userController,
                          decoration: InputDecorations.authInputDecoration(
                              hintText: 'Usuario Asignado',
                              labelText: 'Asignacion'),
                          validator: (String? dato) {
                            if (dato!.isEmpty) {
                              return 'Este campo es requerido';
                            }
                          }),
                      const SizedBox(height: 30),
                      TextFormField(
                          controller: _pointsController,
                          decoration: InputDecorations.authInputDecoration(
                              hintText: 'Puntos de la Tarea',
                              labelText: 'Puntos'),
                          validator: (String? dato) {
                            if (dato!.isEmpty) {
                              return 'Este campo es requerido';
                            }
                          }),
                      const SizedBox(height: 30),
                      TextFormField(
                          controller: _dueDayController,
                          decoration: InputDecorations.authInputDecoration(
                              hintText: 'Lapso de tiempo', labelText: 'Tiempo'),
                          validator: (String? dato) {
                            if (dato!.isEmpty) {
                              return 'Este campo es requerido';
                            }
                          }),
                      const SizedBox(height: 30),
                    ],
                  )),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save_outlined),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await TaskService().saveTasks(
                _tituloController.text,
                _typeController.text,
                _priorityController.text,
                _descriptionController.text,
                _userController.text,
                _pointsController.text,
                _dueDayController.text,
                _doneController.text,
              );
              final taskListProvider =
                  Provider.of<TaskListProvider>(context, listen: false);
              taskListProvider.nuevaTask(
                  _tituloController.text, _descriptionController.text);
            }
            taskServiceProvider.tasks = [];
            taskServiceProvider.loadTasks();
            Navigator.of(context).pushNamed(DashboardScreen.route);
          }),
    );
  }
}

BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Color.fromARGB(255, 76, 0, 255),
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)));
