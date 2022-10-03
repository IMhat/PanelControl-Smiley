// import '../models/task.dart';
// import 'package:flutter/material.dart';

// import '../models/task_model.dart';

// class TaskListProvider extends ChangeNotifier {
//   List<TaskModel> tasks = [];

//   //set tasks(List<TaskModel> tasks) {}

//   Future<TaskModel> nuevaTask(String title, String description) async {
//     final nuevaTask = TaskModel(title: title, description: description);
//     // final id = (await DBProvider.db.nuevaTask(nuevaTask));
//     // Asignar el ID de la base de datos al modelo
//     // nuevaTask.id = id.toString();

//     this.tasks.add(nuevaTask);
//     notifyListeners();

//     return nuevaTask;
//   }

//   cargarTasks() async {
//     // final tasks = await DBProvider.db.getTodasLasTasks();
//     this.tasks = [...tasks];
//     print(tasks);
//     notifyListeners();
//   }

//   borrarTodos() async {
//     // await DBProvider.db.deleteAllTasks();
//     this.tasks = [];
//     notifyListeners();
//   }

//   borrarTaskPorId(
//     String id,
//   ) async {
//     // await DBProvider.db.deleteTask(id);
//     this.cargarTasks();
//   }
// }
