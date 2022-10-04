import 'dart:convert';
// import 'dart:ffi';

TaskModel taskModelFromJson(dynamic str) =>
    TaskModel.fromJson(json.decode(str));
dynamic taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  TaskModel(
      {this.title,
      this.type,
      this.priority,
      this.description,
      this.user,
      this.points,
      // this.done,
      this.due,
      this.id,
      this.createdBy});

  dynamic id;
  dynamic title;
  dynamic type;
  dynamic priority;
  dynamic user;
  String? points;
  // dynamic done;
  dynamic due;
  dynamic description;
  dynamic createdBy;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        priority: json["priority"],
        user: json["user"],
        // done: json["done"],
        due: json["due"],
        points: json["points"],
        description: json["description"],
        createdBy: json["createdBy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "priority": priority,
        "user": user,
        // "done": done,
        "due": due,
        "points": points,
        "description": description,
        "createdBy": createdBy,
      };
}
