import 'dart:convert';
import 'package:project_management/app/features/dashboard/models/task.dart';

// import 'package:project_management/app/shared_components/task_card.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TaskService extends ChangeNotifier {
  final String _baseUrl = 'smiley-appi.herokuapp.com';
  List<Task> tasks = [];
  // List<Task> taskbacklog = [];
  // List<Task> tasktodo = [];
  // List<Task> taskinprogress = [];
  List<Task> tasksDone = [];
  // List<Task> taskapproved = [];

  late Task selectedTask;
  bool isLoading = true;
  bool isSaving = false;
  // late DBProvider _dbProvider;
  TaskService() {
    // _dbProvider = DBProvider();
    loadTasks();
  }

  Future<String> updateTask(Task task) async {
    notifyListeners();
    final url = Uri.https(_baseUrl, '/api/tasks/${task.id}');

    final resp = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "type": task.type,
      }),
    );

    final decodeData = resp.body;
    final index = tasks.indexWhere((element) => element.id == task.id);
    tasks[index] = task;

    // _dbProvider.updateTask(TaskModel(
    //     id: task.id, title: task.title, description: task.description));
    notifyListeners();
    return task.id;
  }

  Future<String> deleteTask(Task task) async {
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

  Future<List<Task>> loadTasks() async {
    isLoading = true;
    final url = Uri.https(_baseUrl, '/api/tasks/backlog');
    final resp = await http.get(url);
    final List<dynamic> tasksMap = jsonDecode(resp.body);
    final jsonData = jsonDecode(resp.body);

    for (var item in jsonData) {
      tasks.add(Task(
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
    return tasks;
  }

  Future<List<Task>> loadTasksDone() async {
    isLoading = true;
    final url = Uri.https(_baseUrl, '/api/tasks/done');
    final resp = await http.get(url);
    final List<dynamic> tasksMap = jsonDecode(resp.body);
    final jsonData = jsonDecode(resp.body);

    for (var item in jsonData) {
      tasksDone.add(Task(
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
    return tasksDone;
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
