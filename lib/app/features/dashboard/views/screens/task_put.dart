import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/services/task_services.dart';
import '../../providers/task_form_provider.dart';
import '../../providers/task_list_provider.dart';
import '../ui/input_decorations.dart';

class TaskPutScreen extends StatefulWidget {
  static const String route = '/taskPut';

  const TaskPutScreen({Key? key}) : super(key: key);

  @override
  State<TaskPutScreen> createState() => _TaskPutScreenState();
}

class _TaskPutScreenState extends State<TaskPutScreen> {
  @override
  Widget build(BuildContext context) {
    final taskService = Provider.of<TaskService>(context);

    return ChangeNotifierProvider(
      create: (_) => TaskFormProvider(taskService.selectedTask),
      child: _TaskPutScreenBody(taskService: taskService),
    );
  }
}

class _TaskPutScreenBody extends StatefulWidget {
  _TaskPutScreenBody({Key? key, required this.taskService}) : super(key: key);

  TaskService taskService;

  @override
  State<_TaskPutScreenBody> createState() => _TaskPutScreenBodyState();
}

class _TaskPutScreenBodyState extends State<_TaskPutScreenBody> {
  @override
  Widget build(BuildContext context) {
    final taskServiceProvider = Provider.of<TaskService>(context);

    final taskForm = Provider.of<TaskFormProvider>(context);
    final task = taskForm.task;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Editar Tarea'),
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
              decoration: _buildBoxDecoration(),
              child: Form(
                  key: taskForm.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: task.title,
                        onChanged: (value) => task.title = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Titulo'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El titulo es obligatorio';
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: task.type,
                        onChanged: (value) => task.type = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Estado'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El estado es obligatorio';
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: task.priority,
                        onChanged: (value) => task.priority = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Prioridad'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La prioridad es obligatorio';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        initialValue: task.description,
                        onChanged: (value) => task.description = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Descripcion'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La descripcion es obligatoria';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        initialValue: task.user,
                        onChanged: (value) => task.user = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Asignacion'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La asignacion es obligatoria';
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      // TextFormField(
                      //   initialValue: task.points,
                      //   onChanged: (value) => task.points = value,
                      //   decoration: InputDecorations.authInputDecoration(
                      //       hintText: "", labelText: 'Puntos'),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Los puntos son obligatoria';
                      //     }
                      //   },
                      // ),
                      const SizedBox(height: 30),
                      // TextFormField(
                      //   initialValue: task.dueDay,
                      //   onChanged: (value) => task.dueDay = value,
                      //   decoration: InputDecorations.authInputDecoration(
                      //       hintText: "", labelText: 'Lapso'),
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'El tiempo es obligatoria';
                      //     }
                      //   },
                      // ),
                      const SizedBox(height: 30),
                    ],
                  )),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    heroTag: null,
                    child: const Icon(Icons.save_outlined),
                    onPressed: () async {
                      if (!taskForm.isValidForm()) return;
                      await widget.taskService.updateTask(taskForm.task);
                      taskServiceProvider.tasks = [];
                      taskServiceProvider.loadTasks();
                      Navigator.pushReplacementNamed(context, 'dashboard');
                    }),
                FloatingActionButton(
                    backgroundColor: Colors.white,
                    heroTag: null,
                    child: Icon(
                      Icons.delete,
                      color: Colors.red[300],
                    ),
                    onPressed: () async {
                      if (!taskForm.isValidForm()) return;
                      await widget.taskService.deleteTask(taskForm.task);
                      // taskServiceProvider.loadTasks();
                      taskServiceProvider.tasks = [];
                      taskServiceProvider.loadTasks();
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Color.fromARGB(255, 76, 0, 255),
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)));
