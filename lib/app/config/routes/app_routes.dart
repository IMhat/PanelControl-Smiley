part of 'app_pages.dart';

/// used to switch pages
class Routes {
  static const dashboard = _Paths.dashboard;
  static const auth = _Paths.auth;

  static const taskPut = _Paths.taskPut;
  static const taskPutToDo = _Paths.taskPutToDo;
  static const taskPutDone = _Paths.taskPutDone;
  static const taskPutInprogress = _Paths.taskPutInprogress;
  static const taskPutApproved = _Paths.taskPutApproved;
  static const taskPost = _Paths.taskPost;
  static const tasks = _Paths.tasks;

  static const productPost = _Paths.productPost;
  static const getProducts = _Paths.getProducts;

  static const getOrders = _Paths.getOrders;
  static const getOrdersDetails = _Paths.getOrdersDetails;

  static const transactionPost = _Paths.transactionPost;
}

/// contains a list of route names.
// made separately to make it easier to manage route naming
class _Paths {
  static const dashboard = '/dashboard';
  static const auth = '/auth-screen';
  static const taskPut = '/taskPut';
  static const taskPutToDo = '/taskPutToDo';
  static const taskPutDone = '/taskPutDone';
  static const taskPutInprogress = '/taskPutInprogress';
  static const taskPutApproved = '/taskPutApproved';
  static const taskPost = '/add-task';
  static const tasks = '/tasks';

  static const productPost = '/add-product';
  static const getProducts = '/get-product';

  static const getOrders = '/getOrders';
  static const getOrdersDetails = '/order-details';

  static const transactionPost = '/transaction';
  // Example :
  // static const index = '/';
  // static const splash = '/splash';
  // static const product = '/product';
}
