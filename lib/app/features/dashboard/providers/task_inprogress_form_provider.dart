import 'package:flutter/material.dart';

import '../models/task_inprogress.dart';

class TaskFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TaskInprogress taskInprogress;

  TaskFormProvider(this.taskInprogress);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
