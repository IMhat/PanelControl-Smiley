import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/config/routes/app_pages.dart';
import 'app/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'app/features/dashboard/providers/task_list_provider.dart';
import 'app/utils/services/task_services.dart';
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
        ChangeNotifierProvider(create: (_) => TaskService()),
        // ChangeNotifierProvider(create: (_) => ProductService()),
        // ChangeNotifierProvider(create: (_) => PointService()),
        ChangeNotifierProvider(create: (_) => TaskListProvider()),
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
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
