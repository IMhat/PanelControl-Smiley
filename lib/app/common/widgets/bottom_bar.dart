// import 'package:smiley_app/constants/global_variables.dart';
// import 'package:smiley_app/features/account/screens/account_screen.dart';
// import 'package:smiley_app/features/account/screens/my_account.dart';
// import 'package:smiley_app/features/cart/screens/cart_screen.dart';
// import 'package:smiley_app/features/home/screens/catalogo_screen.dart';
// import 'package:smiley_app/providers/user_provider.dart';
// import 'package:badges/badges.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../features/home/screens/home1.dart';
// import '../../features/wallet/screens/wallet_screens.dart';

// class BottomBar extends StatefulWidget {
//   static const String routeName = '/actual-home';
//   const BottomBar({Key? key}) : super(key: key);

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   int _page = 0;
//   double bottomNavBarWidth = 42;
//   double bottomNavBarBorderWidth = 5;

//   List<Widget> pages = [
//     const HomePage1(),
//     const HomeScreen(),
//     WalletScreen(),
//     MyAccountScreen(),
//     const CartScreen(),
//   ];

//   void updatePage(int page) {
//     setState(() {
//       _page = page;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final userCartLength = Provider.of<UserProvider>(context).user.cart.length;
//     final userCartLength = context.watch<UserProvider>().user.cart.length;

//     return Scaffold(
//       body: pages[_page],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _page,
//         selectedItemColor: GlobalVariables.selectedNavBarColor,
//         unselectedItemColor: GlobalVariables.unselectedNavBarColor,
//         backgroundColor: GlobalVariables.backgroundColor,
//         iconSize: 28,
//         onTap: updatePage,
//         items: [
//           // first (HOME PAGE)
//           BottomNavigationBarItem(
//             icon: Container(
//               width: bottomNavBarWidth,
//               decoration: BoxDecoration(
//                 border: Border(
//                   top: BorderSide(
//                     color: _page == 0
//                         ? GlobalVariables.selectedNavBarColor
//                         : GlobalVariables.backgroundColor,
//                     width: bottomNavBarBorderWidth,
//                   ),
//                 ),
//               ),
//               child: const Icon(
//                 Icons.home_outlined,
//               ),
//             ),
//             label: '',
//           ),
//           // second (catalogo PAGE)
//           BottomNavigationBarItem(
//             icon: Container(
//               width: bottomNavBarWidth,
//               decoration: BoxDecoration(
//                 border: Border(
//                   top: BorderSide(
//                     color: _page == 1
//                         ? GlobalVariables.selectedNavBarColor
//                         : GlobalVariables.backgroundColor,
//                     width: bottomNavBarBorderWidth,
//                   ),
//                 ),
//               ),
//               child: const Icon(Icons.shop_2_outlined),
//             ),
//             label: '',
//           ),
//           // three (wallet PAGE)
//           BottomNavigationBarItem(
//             icon: Container(
//               width: bottomNavBarWidth,
//               decoration: BoxDecoration(
//                 border: Border(
//                   top: BorderSide(
//                     color: _page == 2
//                         ? GlobalVariables.selectedNavBarColor
//                         : GlobalVariables.backgroundColor,
//                     width: bottomNavBarBorderWidth,
//                   ),
//                 ),
//               ),
//               child: const Icon(Icons.wallet),
//             ),
//             label: '',
//           ),

//           // second (PROFILE PAGE)
//           BottomNavigationBarItem(
//             icon: Container(
//               width: bottomNavBarWidth,
//               decoration: BoxDecoration(
//                 border: Border(
//                   top: BorderSide(
//                     color: _page == 3
//                         ? GlobalVariables.selectedNavBarColor
//                         : GlobalVariables.backgroundColor,
//                     width: bottomNavBarBorderWidth,
//                   ),
//                 ),
//               ),
//               child: const Icon(
//                 Icons.person_outline_outlined,
//               ),
//             ),
//             label: '',
//           ),

//           // third (CART PAGE)
//           BottomNavigationBarItem(
//             icon: Container(
//               width: bottomNavBarWidth,
//               decoration: BoxDecoration(
//                 border: Border(
//                   top: BorderSide(
//                     color: _page == 4
//                         ? GlobalVariables.selectedNavBarColor
//                         : GlobalVariables.backgroundColor,
//                     width: bottomNavBarBorderWidth,
//                   ),
//                 ),
//               ),
//               child: Badge(
//                 elevation: 0,
//                 badgeContent: Text(userCartLength.toString()),
//                 badgeColor: Colors.white,
//                 child: const Icon(
//                   Icons.shopping_cart_outlined,
//                 ),
//               ),
//             ),
//             label: '',
//           ),
//         ],
//       ),
//     );
//   }
// }
