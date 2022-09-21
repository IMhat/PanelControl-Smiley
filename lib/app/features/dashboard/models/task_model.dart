import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));
String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  TaskModel({
    this.title,
    this.type,
    this.priority,
    this.description,
    this.user,
    this.points,
    this.done,
    this.dueDay,
    this.id,
  });

  String? id;
  String? title;
  String? type;
  String? priority;
  String? user;
  String? points;
  String? done;
  String? dueDay;
  String? description;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        priority: json["priority"],
        user: json["user"],
        done: json["done"],
        dueDay: json["dueDay"],
        points: json["points"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "priority": priority,
        "user": user,
        "done": done,
        "dueDay": dueDay,
        "points": points,
        "description": description,
      };
}
