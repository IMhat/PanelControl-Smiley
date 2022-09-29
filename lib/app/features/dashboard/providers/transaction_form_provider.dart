import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Transaction transaction;

  TransactionFormProvider(this.transaction);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
