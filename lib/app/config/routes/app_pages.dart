import 'package:project_management/app/features/auth/screens/auth_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/get_orders.dart';
import 'package:project_management/app/features/dashboard/views/screens/task_post.dart';
import 'package:project_management/app/features/dashboard/views/screens/task_put.dart';
import 'package:project_management/app/features/dashboard/views/screens/task_put_approved.dart';
import 'package:project_management/app/features/dashboard/views/screens/task_put_done.dart';
import 'package:project_management/app/features/dashboard/views/screens/task_put_todo_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/tasks_screen.dart';

import 'package:project_management/app/features/dashboard/views/screens/transaction_post.dart';

import '../../features/dashboard/models/order.dart';
import '../../features/dashboard/views/screens/add_product_screen.dart';
import '../../features/dashboard/views/screens/add_task_screen.dart';
import '../../features/dashboard/views/screens/dashboard_screen.dart';
import 'package:get/get.dart';

import '../../features/dashboard/views/screens/orders_detail_screen.dart';
import '../../features/dashboard/views/screens/products_screen.dart';
import '../../features/dashboard/views/screens/task_put_inprogress.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown
  static const initial = Routes.auth;

  static final routes = [
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.auth,
      page: () => const AuthScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.taskPost,
      page: () => const AddTaskScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.productPost,
      page: () => const AddProductScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.getOrders,
      page: () => const OrdersScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.getProducts,
      page: () => const PostsScreen(),
      binding: DashboardBinding(),
    ),
    // GetPage(

    //   name: _Paths.getOrdersDetails,
    //   page: () => const OrderDetailScreen(order: ,),
    //   binding: DashboardBinding(),
    // ),
    // GetPage(
    //   name: _Paths.taskPutToDo,
    //   page: () => const TaskPutToDoScreen(),
    //   binding: DashboardBinding(),
    // ),
    // GetPage(
    //   name: _Paths.taskPutDone,
    //   page: () => const TaskPutDoneScreen(),
    //   binding: DashboardBinding(),
    // ),
    // GetPage(
    //   name: _Paths.taskPutInprogress,
    //   page: () => const TaskPutInprogressScreen(),
    //   binding: DashboardBinding(),
    // ),
    // GetPage(
    //   name: _Paths.taskPutApproved,
    //   page: () => const TaskPutApprovedScreen(),
    //   binding: DashboardBinding(),
    // ),
    // GetPage(
    //   name: _Paths.taskPost,
    //   page: () => const TaskPostScreen(),
    //   binding: DashboardBinding(),
    // ),
    GetPage(
      name: _Paths.tasks,
      page: () => const TasksScreen(),
      binding: DashboardBinding(),
    ),
    //
    // GetPage(
    //   name: _Paths.transactionPost,
    //   page: () => const TransactionPostScreen(),
    //   binding: DashboardBinding(),
    // ),
  ];
}
