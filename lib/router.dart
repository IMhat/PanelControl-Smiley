import 'package:flutter/material.dart';
import 'package:project_management/app/features/auth/screens/auth_screen.dart';
import 'package:project_management/app/features/dashboard/models/order.dart';
import 'package:project_management/app/features/dashboard/views/screens/add_product_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/add_task_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/dashboard_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/orders_detail_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/products_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/tasks_screen.dart';

import 'app/features/dashboard/views/screens/get_orders.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.route:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case DashboardScreen.route:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DashboardScreen(),
      );
    case AddProductScreen.route:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    case TasksScreen.route:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TasksScreen(),
      );
    case AddTaskScreen.route:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddTaskScreen(),
      );
    case PostsScreen.route:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PostsScreen(),
      );
    // case CategoryDealsScreen.routeName:
    //   var category = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => CategoryDealsScreen(
    //       category: category,
    //     ),
    //   );
    // case SearchScreen.routeName:
    //   var searchQuery = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => SearchScreen(
    //       searchQuery: searchQuery,
    //     ),
    //   );
    // case ProductDetailsScreen.routeName:
    //   var product = routeSettings.arguments as Product;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => ProductDetailsScreen(
    //       product: product,
    //     ),
    //   );
    // case TaskDetailsScreen.routeName:
    //   var task = routeSettings.arguments as Task;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => TaskDetailsScreen(task: task),
    //   );
    // case TaskInprogressDetailsScreen.routeName:
    //   var task = routeSettings.arguments as TaskInprogress;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => TaskInprogressDetailsScreen(task: task),
    //   );
    // case AddressScreen.routeName:
    //   var totalAmount = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => AddressScreen(totalAmount: totalAmount),
    //   );
    case OrderDetailScreen.route:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
    case OrdersScreen.route:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrdersScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
