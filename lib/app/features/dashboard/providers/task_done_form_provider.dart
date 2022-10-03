import 'package:flutter/material.dart';

import '../models/task_done.dart';

class TaskFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TaskDone taskDone;

  TaskFormProvider(this.taskDone);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
