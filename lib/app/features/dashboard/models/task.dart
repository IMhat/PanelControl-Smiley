import 'dart:convert';
import 'package:project_management/app/shared_components/list_profil_image.dart';

class Task {
  late String title;
  late String type;
  late String priority;
  late String description;
  late String user;
  late dynamic points;
  late dynamic done;
  late int dueDay;
  late List profilContributors;
  //<ImageProvider>
  late int totalComments;
  late int totalContributors;
  late String id;

  Task(
    this.title,
    this.type,
    this.priority,
    this.description,
    this.user,
    this.points,
    this.done,
    this.dueDay,
    this.profilContributors,
    this.totalComments,
    this.totalContributors,
    this.id,
  );
  factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  Task.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    type = map['type'];
    priority = map['priority'];
    description = map['description'];
    user = map['user'];
    points = map['points'];
    done = map['done'];
    dueDay = map['dueDay'];
    profilContributors = map['profilContributors'];
    totalComments = map['totalComments'];
    totalContributors = map['totalContributors'];
    id = map['id'];
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "type": type,
        "priority": priority,
        "description": description,
        "user": user,
        "points": points,
        "done": done,
        "dueDay": dueDay,
        "profilContributors": profilContributors,
        "totalComments": totalComments,
        "totalContributors": totalContributors,
        "id": id,
      };

  Task copy() => Task(
        title,
        type,
        priority,
        description,
        user,
        points,
        done,
        dueDay,
        profilContributors,
        totalComments,
        totalContributors,
        id,
      );

  then(Null Function(dynamic value) param0) {}
}
