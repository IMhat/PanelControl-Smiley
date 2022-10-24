import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:project_management/router.dart';

import 'app/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'app/features/auth/screens/initial_screen.dart';

import 'app/features/dashboard/providers/user_provider.dart';
import 'app/features/dashboard/views/screens/noAdmin.dart';
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
        ChangeNotifierProvider(create: (_) => TransactionService()),
        // ChangeNotifierProvider(create: (_) => ProductService()),
        // ChangeNotifierProvider(create: (_) => PointService()),
        // ChangeNotifierProvider(create: (_) => TaskListProvider()),
        // ChangeNotifierProvider(create: (_) => TransactionListProvider()),
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
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'admin'
              ? const InitialScreen()
              : const NoAdminScreen()
          : const InitialScreen(),
    );
  }
}
