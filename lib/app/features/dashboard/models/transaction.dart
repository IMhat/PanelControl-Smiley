import 'dart:convert';

class TaskTransaction {
  final String fromUsername;
  final String toUsername;
  final double amount;
  final String summary;

  TaskTransaction({
    required this.fromUsername,
    required this.toUsername,
    required this.amount,
    required this.summary,
  });

  Map<String, dynamic> toMap() {
    return {
      'fromUsername': fromUsername,
      'toUsername': toUsername,
      'amount': amount,
      'summary': summary,
    };
  }

  factory TaskTransaction.fromMap(Map<String, dynamic> map) {
    return TaskTransaction(
      fromUsername: map['fromUsername'] ?? '',
      toUsername: map['toUsername'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      summary: map['summary'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskTransaction.fromJson(String source) =>
      TaskTransaction.fromMap(json.decode(source));
}
