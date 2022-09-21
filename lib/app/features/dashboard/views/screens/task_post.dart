import '../../../../utils/services/task_services.dart';
import '../../models/task_model.dart';
import '../../providers/task_form_provider.dart';
import '../../providers/task_list_provider.dart';
import '../ui/input_decorations.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskPostScreen extends StatefulWidget {
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
              height: 200,
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
                  _descriptionController.text,
                  _userController.text,
                  _pointsController.text,
                  _dueDayController.text,
                  _doneController.text,
                  _priorityController.text);
              final taskListProvider =
                  Provider.of<TaskListProvider>(context, listen: false);
              taskListProvider.nuevaTask(
                  _tituloController.text, _descriptionController.text);
            }
            taskServiceProvider.tasks = [];
            taskServiceProvider.loadTasks();
            Navigator.of(context).pop();
          }),
    );
  }
}

BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)));
