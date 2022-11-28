import 'package:flutter/material.dart';

import '../models/task_done.dart';

class TaskDoneFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TaskDone taskDone;

  TaskDoneFormProvider(this.taskDone);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
