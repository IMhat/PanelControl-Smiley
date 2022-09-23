import 'package:project_management/app/features/dashboard/views/screens/task_post.dart';
import 'package:project_management/app/features/dashboard/views/screens/task_put.dart';

import '../../features/dashboard/views/screens/dashboard_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown
  static const initial = Routes.dashboard;

  static final routes = [
    GetPage(
      name: _Paths.dashboard,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.taskPut,
      page: () => TaskPutScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.taskPost,
      page: () => TaskPostScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
