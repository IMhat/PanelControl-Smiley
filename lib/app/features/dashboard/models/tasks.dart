import 'dart:convert';

class Task {
  final String title;
  final String priority;
  final String description;
  //final List<String> images;
  final String category;
  final double points;
  final String assignmentUser;
  final String status;
  final String createdBy;
  final String label;
  final String startDate;
  final String endDate;
  final String? id;

  Task({
    required this.title,
    required this.priority,
    required this.description,
    //required this.images,
    required this.category,
    required this.points,
    required this.assignmentUser,
    required this.status,
    required this.createdBy,
    required this.label,
    required this.startDate,
    required this.endDate,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'priority': priority,
      'description': description,
      //'images': images,
      'category': category,
      'points': points,
      'assignmentUser': assignmentUser,
      'status': status,
      'createdBy': createdBy,
      'label': label,
      'endDate': endDate,
      'startDate': startDate,
      'id': id,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      priority: map['priority'] ?? '',
      description: map['description'] ?? '',
      //images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      points: map['points']?.toDouble() ?? 0.0,
      assignmentUser: map['assignmentUser'] ?? '',
      status: map['status'] ?? '',
      createdBy: map['createdBy'] ?? '',
      label: map['label'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
}


