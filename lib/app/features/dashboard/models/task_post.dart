import 'dart:convert';

class TaskPost {
  final String title;
  final String priority;
  final String description;
  final List<String> images;
  final String category;
  final double points;
  final String assignmentUser;
  final String status;
  final String createdBy;
  final String? id;

  TaskPost({
    required this.title,
    required this.priority,
    required this.description,
    required this.images,
    required this.category,
    required this.points,
    required this.assignmentUser,
    required this.status,
    required this.createdBy,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'priority': priority,
      'description': description,
      'images': images,
      'category': category,
      'points': points,
      'assignmentUser': assignmentUser,
      'status': status,
      'createdBy': createdBy,
      'id': id,
    };
  }

  factory TaskPost.fromMap(Map<String, dynamic> map) {
    return TaskPost(
      title: map['title'] ?? '',
      priority: map['priority'] ?? '',
      description: map['description'] ?? '',
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      points: map['points']?.toDouble() ?? 0.0,
      assignmentUser: map['assignmentUser'] ?? '',
      status: map['status'] ?? '',
      createdBy: map['createdBy'] ?? '',
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskPost.fromJson(String source) =>
      TaskPost.fromMap(json.decode(source));
}
