import 'package:flutter/material.dart';
import 'package:project_management/app/features/dashboard/views/screens/tasks_screen.dart';
// import 'package:project_management/app/features/dashboard/models/task_todo.dart';

// import 'package:project_management/app/utils/services/ToDo_task_service.dart';
import 'package:project_management/app/utils/services/inprogress_task_service.dart';

import 'package:provider/provider.dart';
// import '../../../../utils/services/task_services.dart';
import '../../../../utils/services/transaction_services.dart';
import '../../models/transaction_model.dart';

// import '../../providers/task_form_provider.dart';
import '../../providers/task_inprogress_form_provider.dart';

import '../../providers/transaction_list_provider.dart';

import '../ui/input_decorations.dart';
import 'dashboard_screen.dart';

class TaskPutInprogressScreen extends StatefulWidget {
  static const String route = '/taskPutInprogress';

  const TaskPutInprogressScreen({Key? key}) : super(key: key);

  @override
  State<TaskPutInprogressScreen> createState() =>
      _TaskPutInprogressScreenState();
}

class _TaskPutInprogressScreenState extends State<TaskPutInprogressScreen> {
  @override
  Widget build(BuildContext context) {
    final taskService = Provider.of<TaskInprogressService>(context);

    return ChangeNotifierProvider(
      create: (_) => TaskFormProvider(taskService.selectedTask),
      child: _TaskPutInprogressScreenBody(taskService: taskService),
    );
  }
}

class _TaskPutInprogressScreenBody extends StatefulWidget {
  _TaskPutInprogressScreenBody({Key? key, required this.taskService})
      : super(key: key);

  TaskInprogressService taskService;

  @override
  State<_TaskPutInprogressScreenBody> createState() =>
      _TaskPutInprogressScreenBodyState();
}

class _TaskPutInprogressScreenBodyState
    extends State<_TaskPutInprogressScreenBody> {
  late TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    final taskServiceProvider = Provider.of<TaskInprogressService>(context);

    final taskForm = Provider.of<TaskFormProvider>(context);
    final task = taskForm.taskInprogress;

    final transactionServiceProvider =
        Provider.of<TransactionService>(context, listen: false);
    final scanListProvider =
        Provider.of<TransactionListProvider>(context, listen: false);

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
              width: 1000,
              height: 90,
              decoration: _buildBoxDecoration1(),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                runAlignment: WrapAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding:
                          const EdgeInsets.only(top: 5, left: 10, right: 10),
                      width: 280,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 21, 255)),
                          borderRadius: BorderRadius.circular(10)),
                      child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.check),
                          label: const Text("Marcar como finalizada"))),
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
              padding: const EdgeInsets.only(right: 10, left: 10),
              width: 1000,
              decoration: _buildBoxDecoration2(),
              child: Form(
                  key: taskForm.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        initialValue: task.title,
                        onChanged: (value) => task.title = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Titulo'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El titulo es obligatorio';
                          }
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        initialValue: task.type,
                        onChanged: (value) => task.type = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Estado'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El estado es obligatorio';
                          }
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        initialValue: task.priority,
                        onChanged: (value) => task.priority = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Prioridad'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La prioridad es obligatorio';
                          }
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        initialValue: task.createdBy,
                        onChanged: (value) => task.createdBy = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'createdBy'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La prioridad es obligatorio';
                          }
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        initialValue: task.description,
                        onChanged: (value) => task.description = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Descripcion'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La descripcion es obligatoria';
                          }
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        initialValue: task.user,
                        onChanged: (value) => task.user = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Asignacion'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La asignacion es obligatoria';
                          }
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        initialValue: task.points,
                        onChanged: (value) => task.points = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Puntos'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Los puntos son obligatoria';
                          }
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
                      // Text(task.points),
                      const SizedBox(height: 30),
                      TextFormField(
                        initialValue: task.due,
                        onChanged: (value) => task.due = value,
                        decoration: InputDecorations.authInputDecoration(
                            hintText: "", labelText: 'Lapso'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El tiempo es obligatoria';
                          }
                        },
                        style: const TextStyle(color: Colors.black),
                      ),
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
                      //if (!taskForm.isValidForm()) return;
                      await widget.taskService
                          .updateTask(taskForm.taskInprogress);
                      taskServiceProvider.tasksInprogress = [];
                      taskServiceProvider.loadTasks();
                      Navigator.of(context).pushNamed(TasksScreen.route);
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
                      await widget.taskService
                          .deleteTask(taskForm.taskInprogress);
                      // taskServiceProvider.loadTasks();
                      taskServiceProvider.tasksInprogress = [];
                      taskServiceProvider.loadTasks();

                      Navigator.of(context).pop();
                    }),
                FloatingActionButton(
                    child: const Icon(Icons.approval_rounded),
                    onPressed: () async {
                      task.type = "approved";
                      widget.taskService.updateTask(taskForm.taskInprogress);
                      await TransactionService().saveTransactions(
                        task.createdBy,
                        task.user,
                        task.points,
                        task.title,
                      );
                      // final transactionListProvider =
                      //     Provider.of<TransactionListProvider>(context, listen: false);
                      // transactionListProvider.nuevaTransaction(
                      //   _fromUsernameController.text,
                      //   _toUsernameController.text,
                      //   _amountController.text,
                      //   _summaryController.text,
                      // );

                      // transactionServiceProvider.transactions = [];
                      // transactionServiceProvider.loadTransactions();
                      Navigator.of(context).pushNamed(TasksScreen.route);
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _buildBoxDecoration1() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25)));

BoxDecoration _buildBoxDecoration2() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25)));
