import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project_management/app/features/dashboard/views/screens/task_put.dart';
import 'package:project_management/app/features/dashboard/views/screens/task_put_done.dart';
import 'package:project_management/app/features/dashboard/views/screens/tasks_screen.dart';

import 'package:project_management/app/features/dashboard/views/screens/transaction_post.dart';
import 'package:project_management/app/utils/services/approved_task_service.dart';
import 'package:project_management/app/utils/services/done_task_service.dart';
import 'package:project_management/app/utils/services/inprogress_task_service.dart';
import 'package:project_management/router.dart';

import 'app/config/routes/app_pages.dart';
import 'app/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'app/features/auth/screens/initial_screen.dart';
import 'app/features/dashboard/providers/task_list_provider.dart';
import 'app/features/dashboard/providers/transaction_list_provider.dart';
import 'app/features/dashboard/providers/user_provider.dart';
import 'app/features/dashboard/views/screens/dashboard_screen.dart';
import 'app/features/dashboard/views/screens/noAdmin.dart';
import 'app/features/dashboard/views/screens/task_post.dart';
import 'app/features/dashboard/views/screens/task_put_approved.dart';
import 'app/features/dashboard/views/screens/task_put_inprogress.dart';
import 'app/features/dashboard/views/screens/task_put_todo_screen.dart';
import 'app/utils/services/ToDo_task_service.dart';
import 'app/utils/services/task_services.dart';
import 'app/utils/services/transaction_services.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (_) => TaskService()),
        ChangeNotifierProvider(create: (_) => TaskToDoService()),
        ChangeNotifierProvider(create: (_) => TaskInprogressService()),
        ChangeNotifierProvider(create: (_) => TaskDoneService()),
        ChangeNotifierProvider(create: (_) => TaskApprovedService()),
        ChangeNotifierProvider(create: (_) => TransactionService()),
        // ChangeNotifierProvider(create: (_) => ProductService()),
        // ChangeNotifierProvider(create: (_) => PointService()),
        // ChangeNotifierProvider(create: (_) => TaskListProvider()),
        ChangeNotifierProvider(create: (_) => TransactionListProvider()),
        // ChangeNotifierProvider(create: (_) => ProductListProvider()),
        // ChangeNotifierProvider(create: (_) => PointListProvider()),
        // ChangeNotifierProvider(create: (_) => UserListProvider()),
        // ChangeNotifierProvider(create: (_) => UserService()),
        // ChangeNotifierProvider(create: (_) => ImageServices()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Project Management',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.basic,
      // initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      onGenerateRoute: (settings) => generateRoute(settings),
      routes: {
        // HomePage.route: (context) => HomePage(),
        TaskPostScreen.route: (context) => const TaskPostScreen(),

        TaskPutScreen.route: (context) => const TaskPutScreen(),

        TaskPutToDoScreen.route: (context) => const TaskPutToDoScreen(),

        TaskPutInprogressScreen.route: (context) =>
            const TaskPutInprogressScreen(),

        TaskPutDoneScreen.route: (context) => const TaskPutDoneScreen(),

        TaskPutApprovedScreen.route: (context) => const TaskPutApprovedScreen(),

        DashboardScreen.route: (context) => const DashboardScreen(),

        TasksScreen.route: (context) => const TasksScreen(),

        // TransactionPostScreen.route: (context) => const TransactionPostScreen(),
      },
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'admin'
              ? const InitialScreen()
              : const NoAdminScreen()
          : const InitialScreen(),
    );
  }
}
