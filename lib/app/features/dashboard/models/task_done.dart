import 'dart:convert';

class TaskDone {
  late String title;
  late String priority;
  late String description;
  // late List<String> images;
  late int points;
  late String category;
  late String assignmentUser;
  late String status;
  late String createdBy;
  // late String id;
  TaskDone(
    this.title,
    this.priority,
    this.description,
    // this.images,
    this.points,
    this.category,
    this.assignmentUser,
    this.status,
    this.createdBy,
    // this.id,
  );
  factory TaskDone.fromJson(String str) => TaskDone.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  TaskDone.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    priority = map['priority'];
    description = map['description'];
    // points =
    // map['quantity']?.toDouble() ?? 0.0;
    // images  =
    // List<String>.from(map['images']);
    // images = map['images'];
    points = map['points'];
    category = map['category'];
    assignmentUser = map['assignmentUser'];
    status = map['status'];
    createdBy = map['createdBy'];
    // id = map['id'];
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "priority": priority,
        "description": description,
        // "images": images,
        "points": points,
        "category": category,
        "assignmentUser": assignmentUser,
        "status": status,
        "createdBy": createdBy,
        // "id": id,
      };

  TaskDone copy() => TaskDone(
        title,
        priority,
        description,
        // images,
        points,
        category,
        assignmentUser,
        status,
        createdBy,
        // id,
      );

  then(Null Function(dynamic value) param0) {}
}
