// import 'dart:convert';
// import 'package:project_management/app/features/dashboard/models/transaction.dart';

// // import 'package:project_management/app/shared_components/task_card.dart';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class TransactionService extends ChangeNotifier {
//   final String _baseUrl = 'smiley-appi.herokuapp.com';

//   List<Transaction> transactions = [];

//   late Transaction selectedTransaction;

//   bool isLoading = true;
//   bool isSaving = false;
//   // late DBProvider _dbProvider;
//   TransactionService() {
//     // _dbProvider = DBProvider();
//     loadTransactions();
//   }

//   Future<String> updateTransaction(Transaction transaction) async {
//     notifyListeners();
//     final url = Uri.https(_baseUrl, '/api/transaction/${transaction.id}');
//     final resp = await http.put(url, body: transaction.toJson());
//     final decodeData = resp.body;

//     final index =
//         transactions.indexWhere((element) => element.id == transaction.id);
//     transactions[index] = transaction;

//     // _dbProvider.updateTask(TaskModel(
//     //     id: task.id, title: task.title, description: task.description));
//     notifyListeners();
//     return transaction.id;
//   }

//   Future<String> deleteTransaction(Transaction transaction) async {
//     notifyListeners();
//     final url = Uri.https(_baseUrl, '/api/transaction/${transaction.id}');
//     final resp = await http.delete(url, body: transaction.toJson());
//     final decodeData = resp.body;
//     //final index = tasks.indexWhere((element) => element.id == task.id);
//     // tasks[index] = task;
//     // _dbProvider.deleteTask(task.id);
//     notifyListeners();
//     return transaction.id;
//   }

//   Future<List<Transaction>> loadTransactions() async {
//     isLoading = true;
//     final url = Uri.https(_baseUrl, '/api/transaction');
//     final resp = await http.get(url);
//     final List<dynamic> transactionsMap = jsonDecode(resp.body);
//     final jsonData = jsonDecode(resp.body);

//     for (var item in jsonData) {
//       transactions.add(Transaction(item["fromUsername"], item["toUsername"],
//           item["amount"], item["summary"], item["id"]));

//       // _dbProvider.getTodasLasTasks();
//       // _dbProvider.nuevaTask(TaskModel(
//       //     id: item["id"],
//       //     title: item["title"],
//       //     description: item["description"]));
//       // _dbProvider.getTodasLasTasks();
//     }

//     isLoading = false;
//     notifyListeners();
//     return transactions;
//   }

//   Future<http.Response> saveTransactions(
//     String text,
//     String text2,
//     String? text3,
//     String text4,
//   ) {
//     return http.post(
//       Uri.parse('https://smiley-appi.herokuapp.com/api/transaction/transfer'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, dynamic>{
//         'fromUsername': text,
//         'toUsername': text2,
//         'amount': text3,
//         'summary': text4,
//       }),
//     );
//   }
// }
