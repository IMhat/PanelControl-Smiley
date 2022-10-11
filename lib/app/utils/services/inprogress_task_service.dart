import 'dart:convert';
// import 'package:project_management/app/features/dashboard/models/task.dart';

// import 'package:project_management/app/shared_components/task_card.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_management/app/features/dashboard/models/task_inprogress.dart';

class TaskInprogressService extends ChangeNotifier {
  final String _baseUrl = 'smiley-appi.herokuapp.com';
  List<TaskInprogress> tasksInprogress = [];

  late TaskInprogress selectedTask;

  bool isLoading = true;
  bool isSaving = false;
  // late DBProvider _dbProvider;
  TaskInprogressService() {
    // _dbProvider = DBProvider();
    loadTasks();
  }

  Future<String> updateTask(TaskInprogress task) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, '/api/tasks/${task.id}');
    final resp = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "type": task.type,
        'title': task.title,
        'priority': task.priority,
        'description': task.description,
        'user': task.user,
        'points': task.points,
        // 'done': text7,
        'due': task.due,
        'createdBy': task.createdBy
      }),
    );
    final decodeData = resp.body;
    final index =
        tasksInprogress.indexWhere((element) => element.id == task.id);
    tasksInprogress[index] = task;

    // _dbProvider.updateTask(TaskModel(
    //     id: task.id, title: task.title, description: task.description));
    notifyListeners();
    return task.id;
  }

  Future<String> deleteTask(TaskInprogress task) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, '/api/tasks/${task.id}');
    final resp = await http.delete(url, body: task.toJson());
    final decodeData = resp.body;
    //final index = tasks.indexWhere((element) => element.id == task.id);
    // tasks[index] = task;
    // _dbProvider.deleteTask(task.id);
    notifyListeners();
    return task.id;
  }

  Future<List<TaskInprogress>> loadTasks() async {
    isLoading = true;
    final url = Uri.https(_baseUrl, '/api/tasks/inprogress');
    final resp = await http.get(url);
    final List<dynamic> tasksMap = jsonDecode(resp.body);
    final jsonData = jsonDecode(resp.body);

    for (var item in jsonData) {
      tasksInprogress.add(TaskInprogress(
          item["title"],
          item["type"],
          item["priority"],
          item["description"],
          item["user"],
          item["points"],
          // item["done"],
          item["due"],
          item["createdBy"],
          // item["dueDay"],
          // item["profilContributors"],
          // item["totalComments"],
          // item["totalContributors"],
          item["id"]));

      // _dbProvider.getTodasLasTasks();
      // _dbProvider.nuevaTask(TaskModel(
      //     id: item["id"],
      //     title: item["title"],
      //     description: item["description"]));
      // _dbProvider.getTodasLasTasks();
    }

    isLoading = false;
    notifyListeners();
    return tasksInprogress;
  }

  Future<http.Response> saveTasks(
    dynamic text,
    dynamic text2,
    dynamic text3,
    dynamic text4,
    dynamic text5,
    String? text6,
    // dynamic text7,
    dynamic text8,
    dynamic text9,
    // dynamic text10,
    // dynamic text11
  ) {
    return http.post(
      Uri.parse('https://smiley-appi.herokuapp.com/api/tasks'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': text,
        'type': text2,
        'priority': text3,
        'description': text4,
        'user': text5,
        'points': text6,
        // 'done': text7,
        'due': text8,
        'createdBy': text9
        // 'profilContributors': text9,
        // 'totalComments': text10,
        // 'totalContributors': text11,
      }),
    );
  }
}
