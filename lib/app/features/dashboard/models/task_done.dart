import 'dart:convert';
import 'package:project_management/app/shared_components/list_profil_image.dart';

class TaskDone {
  late dynamic title;
  late dynamic type;
  late dynamic priority;
  late dynamic description;
  late dynamic user;
  late String? points;
  // late dynamic done;
  late dynamic due;
  late dynamic createdBy;
  // late List profilContributors;
  // //<ImageProvider>
  // late int totalComments;
  // late int totalContributors;
  late dynamic id;

  TaskDone(
    this.title,
    this.type,
    this.priority,
    this.description,
    this.user,
    this.points,
    // this.done,
    this.due,
    this.createdBy,
    // this.profilContributors,
    // this.totalComments,
    // this.totalContributors,
    this.id,
  );
  factory TaskDone.fromJson(dynamic str) => TaskDone.fromMap(json.decode(str));

  dynamic toJson() => json.encode(toMap());
  TaskDone.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    type = map['type'];
    priority = map['priority'];
    description = map['description'];
    user = map['user'];
    points = map['points'];
    // done = map['done'];
    due = map['due'];
    createdBy = map['createdBy'];
    // profilContributors = map['profilContributors'];
    // totalComments = map['totalComments'];
    // totalContributors = map['totalContributors'];
    id = map['id'];
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "type": type,
        "priority": priority,
        "description": description,
        "user": user,
        "points": points,
        // "done": done,
        "due": due,
        "createdBy": createdBy,
        // "profilContributors": profilContributors,
        // "totalComments": totalComments,
        // "totalContributors": totalContributors,
        "id": id,
      };

  TaskDone copy() => TaskDone(
        title,
        type,
        priority,
        description,
        user,
        points,
        // done,
        due,
        createdBy,
        // profilContributors,
        // totalComments,
        // totalContributors,
        id,
      );

  then(Null Function(dynamic value) param0) {}
}
