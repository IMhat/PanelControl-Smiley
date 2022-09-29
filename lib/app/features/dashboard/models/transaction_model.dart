import 'dart:convert';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));
String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  TransactionModel({
    this.fromUsername,
    this.toUsername,
    this.amount,
    this.summary,
  });

  String? fromUsername;
  String? toUsername;
  dynamic amount;
  String? summary;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        fromUsername: json["fromUsername"],
        toUsername: json["toUsername"],
        amount: json["amount"],
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "fromUsername": fromUsername,
        "toUsername": toUsername,
        "amount": amount,
        "summary": summary,
      };
}
