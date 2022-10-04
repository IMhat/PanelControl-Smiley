import 'dart:convert';

class Transaction {
  late String fromUsername;
  late String toUsername;
  late String? amount;
  late String summary;
  late String id;

  Transaction(
    this.fromUsername,
    this.toUsername,
    this.amount,
    this.summary,
    this.id,
  );
  factory Transaction.fromJson(String str) =>
      Transaction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  Transaction.fromMap(Map<String, dynamic> map) {
    fromUsername = map['fromUsername'];
    toUsername = map['toUsername'];
    amount = map['amount'];
    summary = map['summary'];
    id = map['id'];
  }

  Map<String, dynamic> toMap() => {
        "fromUsername": fromUsername,
        "toUsername": toUsername,
        "amount": amount,
        "summary": summary,
        "id": id,
      };

  Transaction copy() => Transaction(
        fromUsername,
        toUsername,
        amount,
        summary,
        id,
      );

  then(Null Function(dynamic value) param0) {}
}
