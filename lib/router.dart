import 'package:flutter/material.dart';
import 'package:project_management/app/features/auth/screens/auth_screen.dart';
import 'package:project_management/app/features/dashboard/models/order.dart';
import 'package:project_management/app/features/dashboard/models/task_approved.dart';
import 'package:project_management/app/features/dashboard/models/task_done.dart';
import 'package:project_management/app/features/dashboard/models/task_todo.dart';
import 'package:project_management/app/features/dashboard/views/screens/add_product_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/add_task_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/dashboard_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/orders_detail_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/products_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/tasks_screen.dart';

import 'app/features/dashboard/models/product.dart';
import 'app/features/dashboard/models/task_inprogress.dart';
import 'app/features/dashboard/models/tasks.dart';
import 'app/features/dashboard/views/screens/calendar_screen.dart';
import 'app/features/dashboard/views/screens/get_orders.dart';
import 'app/features/dashboard/views/screens/product_details_screen.dart';
import 'app/features/dashboard/views/screens/search_screen.dart';
import 'app/features/dashboard/views/screens/task_ToDo_details_screen.dart';
import 'app/features/dashboard/views/screens/task_approved_details_screen.dart';
import 'app/features/dashboard/views/screens/task_detail_screen.dart';
import 'app/features/dashboard/views/screens/task_done_details_screen.dart';
import 'app/features/dashboard/views/screens/task_inprogress_detail_screen.dart';
import 'app/utils/widgets/Widgets/datatable/datatable_prueba.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.route:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case DashboardScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DashboardScreen(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    case TasksScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TasksScreen(),
      );
    case AddTaskScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddTaskScreen(),
      );
    case PostsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PostsScreen(),
      );
    case PostsScreen.routeName:
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
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDetailsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailsScreen(
          product: product,
        ),
      );
    case TaskDetailsScreen.routeName:
      var task = routeSettings.arguments as Task;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TaskDetailsScreen(task: task),
      );
    case TaskToDoDetailsScreen.routeName:
      var task = routeSettings.arguments as TaskToDo;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TaskToDoDetailsScreen(task: task),
      );
    case TaskInprogressDetailsScreen.routeName:
      var task = routeSettings.arguments as TaskInprogress;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TaskInprogressDetailsScreen(task: task),
      );
    case TaskDoneDetailsScreen.routeName:
      var task = routeSettings.arguments as TaskDone;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TaskDoneDetailsScreen(task: task),
      );
    case TaskApprovedDetailsScreen.routeName:
      var task = routeSettings.arguments as TaskApproved;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TaskApprovedDetailsScreen(task: task),
      );
    // case AddressScreen.routeName:
    //   var totalAmount = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => AddressScreen(totalAmount: totalAmount),
    //   );
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
    case OrdersScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrdersScreen(),
      );
    case CalendarScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CalendarScreen(),
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
