import 'package:flutter/material.dart';

import '../models/task_approved.dart';

class TaskFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TaskApproved taskApproved;

  TaskFormProvider(this.taskApproved);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
