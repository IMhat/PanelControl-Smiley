part of 'app_pages.dart';

/// used to switch pages
class Routes {
  static const dashboard = _Paths.dashboard;

  static const taskPut = _Paths.taskPut;
  static const taskPost = _Paths.taskPost;
  static const tasks = _Paths.tasks;

  static const transactionPost = _Paths.transactionPost;
}

/// contains a list of route names.
// made separately to make it easier to manage route naming
class _Paths {
  static const dashboard = '/dashboard';
  static const taskPut = '/taskPut';
  static const taskPost = '/taskPost';
  static const tasks = '/tasks';

  static const transactionPost = '/transaction';
  // Example :
  // static const index = '/';
  // static const splash = '/splash';
  // static const product = '/product';
}
