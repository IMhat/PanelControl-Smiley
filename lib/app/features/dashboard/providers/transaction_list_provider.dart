import '../models/task.dart';
import 'package:flutter/material.dart';

import '../models/transaction_model.dart';

class TransactionListProvider extends ChangeNotifier {
  List<TransactionModel> transactions = [];

  //set tasks(List<TaskModel> tasks) {}

  Future<TransactionModel> nuevaTransaction(String fromUsername,
      String toUsername, dynamic amount, String summary) async {
    final nuevaTransaction = TransactionModel(
        fromUsername: fromUsername,
        toUsername: toUsername,
        amount: amount,
        summary: summary);
    // final id = (await DBProvider.db.nuevaTask(nuevaTask));
    // Asignar el ID de la base de datos al modelo
    // nuevaTask.id = id.toString();

    this.transactions.add(nuevaTransaction);
    notifyListeners();

    return nuevaTransaction;
  }

  cargarTransactions() async {
    // final tasks = await DBProvider.db.getTodasLasTasks();
    this.transactions = [...transactions];
    print(transactions);
    notifyListeners();
  }

  borrarTodos() async {
    // await DBProvider.db.deleteAllTasks();
    this.transactions = [];
    notifyListeners();
  }

  borrarTaskPorId(
    String id,
  ) async {
    // await DBProvider.db.deleteTask(id);
    this.cargarTransactions();
  }
}
