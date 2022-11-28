import 'package:flutter/material.dart';


import '../models/tasks.dart';

class TaskFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Task task;

  TaskFormProvider(this.task);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
