import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_management/app/features/dashboard/models/product.dart';
import 'package:project_management/app/features/dashboard/views/screens/add_product_screen.dart';
import 'package:project_management/app/features/dashboard/views/screens/search_screen.dart';
import 'package:project_management/app/utils/widgets/Widgets/products/product_gridview.dart';
import 'package:project_management/app/utils/widgets/Widgets/products/product_listview.dart';
import 'package:project_management/app/utils/widgets/sidebar/sidebar_products.dart';

import '../../../../constans/app_constants.dart';
import '../../../../shared_components/responsive_builder.dart';
import '../../../../utils/services/admin_services.dart';

class PostsScreen extends StatefulWidget {
  static const String routeName = '/get-product';
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: controller.scaffoldKey,
      drawer: (ResponsiveBuilder.isDesktop(context))
          ? null
          : const Drawer(
              child: Padding(
                padding: EdgeInsets.only(top: kSpacing),
                child: SidebarProducts(),
              ),
            ),
      appBar: AppBar(backgroundColor: const Color(0xff48409E)),
      body: SingleChildScrollView(
          child: ResponsiveBuilder(
        mobileBuilder: (context, constraints) {
          return Column(children: const [
            SizedBox(height: kSpacing * (kIsWeb ? 1 : 2)),
            MyProducts(),
          ]);
        },
        tabletBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: (constraints.maxWidth < 950) ? 6 : 9,
                  child: const MyProducts()),
              //const Flexible(flex: 4, child: TaskResponsive())
            ],
          );
        },
        desktopBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SidebarHomeTask(),
              Flexible(
                flex: (constraints.maxWidth < 1360) ? 4 : 3,
                child: const ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(kBorderRadius),
                      bottomRight: Radius.circular(kBorderRadius),
                    ),
                    child: SidebarProducts()),
              ),
              const Flexible(
                flex: 9,
                child: MyProducts(),
              ),
            ],
          );
        },
      )),
    );
  }
}

class MyProducts extends StatefulWidget {
  const MyProducts({Key? key}) : super(key: key);

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts>
    with SingleTickerProviderStateMixin {
  int selectedPage = 0;
  TabController? controller;
  @override
  void initState() {
    super.initState();
    controller =
        TabController(length: 2, initialIndex: selectedPage, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  List<Product>?  products;
  final AdminServices adminServices = AdminServices();

  // @override
  // void initState() {
  //   super.initState();
  //   fetchAllProducts();
  // }

  // fetchAllProducts() async {
  //   products = await adminServices.fetchAllProducts(context);
  //   setState(() {});
  // }

  // void deleteProduct(Product product, int index) {
  //   adminServices.deleteProduct(
  //     context: context,
  //     product: product,
  //     onSuccess: () {
  //       products!.removeAt(index);
  //       setState(() {});
  //     },
  //   );
  // }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  final textStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 255, 255, 255));
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Wrap(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 40),
                width: 1450,
                height: 80,
                decoration: _buildBoxDecoration1(),
                child: Wrap(
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    // Container(
                    //   margin: const EdgeInsets.only(left: 20, top: 10),
                    //   width: 250,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Wrap(children: [
                    //         Text(
                    //           "Productos",
                    //           style: textStyle,
                    //         ),
                    //         const SizedBox(
                    //           width: 10,
                    //         ),
                    //         const Text(
                    //           "Uteam",
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.w600,
                    //               fontSize: 20),
                    //         ),
                    //       ]),
                    //     ],
                    //   ),
                    // ),
                    searchProduct(),
                    Container(
                      margin: const EdgeInsets.all(25),
                      width: 350,
                      height: 50,
                      child: const Text("Agrega productos al catálogo",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20)),
                    ),

                    // const SizedBox(width: 20),
                    // Container(
                    //     child: SearchScreen(
                    //   searchQuery: PostsScreen.routeName,
                    // )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: const Color(0xff48409E),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                    onPressed: navigateToAddProduct,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
          Container(
            width: 800,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.deepPurple))),
            child: Material(
              color: Colors.white,
              child: TabBar(
                controller: controller,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 147, 144, 181),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[850]!.withOpacity(0.29),
                              offset: const Offset(-10, 10),
                              blurRadius: 10,
                            )
                          ]),
                      child: const Icon(
                        Icons.list,
                        color: Color(0xff48409E),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: (const Color.fromARGB(255, 147, 144, 181)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[850]!.withOpacity(0.29),
                              offset: const Offset(-10, 10),
                              blurRadius: 10,
                            )
                          ]),
                      child: const Icon(
                        Icons.grid_on,
                        color: Color(0xff48409E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 1000,
            height: 900,
            child: TabBarView(
              controller: controller,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, left: 20, bottom: 20),
                  child: const SingleChildScrollView(child: ProductListView()),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, left: 20, bottom: 20),
                  child: const SingleChildScrollView(child: ProductGridView()),
                ),
              ],
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(top: 30),
          //   width: 60,
          //   height: 60,
          //   decoration: BoxDecoration(
          //       color: const Color(0xff48409E),
          //       borderRadius: BorderRadius.circular(30)),
          //   child: IconButton(
          //       onPressed: navigateToAddProduct,
          //       icon: const Icon(
          //         Icons.add,
          //         color: Colors.white,
          //       )),
          // ),
        ],
      ),
    );
  }

  Container searchProduct() {
    return Container(
                    margin: const EdgeInsets.all(25),
                    height: 30,
                    width: 200,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              height: 42,
                              margin: const EdgeInsets.only(left: 15),
                              child: Material(
                                borderRadius: BorderRadius.circular(7),
                                elevation: 1,
                                child: TextFormField(
                                  onFieldSubmitted: navigateToSearchScreen,
                                  decoration: InputDecoration(
                                    prefixIcon: InkWell(
                                      onTap: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                          left: 6,
                                        ),
                                        child: Icon(
                                          Icons.search,
                                          color: Colors.black,
                                          size: 23,
                                        ),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                        const EdgeInsets.only(top: 10),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(7),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(7),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.black38,
                                        width: 1,
                                      ),
                                    ),
                                    hintText: 'Search Catalog',
                                    hintStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.transparent,
                            height: 42,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10),
                            child: const Icon(Icons.mic,
                                color: Colors.black, size: 25),
                          ),
                        ],
                      ),
                    ),
                  );
  }
}

BoxDecoration _buildBoxDecoration1() => const BoxDecoration(
    color: Color(0xff48409E),
    gradient: LinearGradient(colors: <Color>[
      (Color(0xff48409E)),
      (Color(0xff4332F7)),
    ]),
    borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(15),
        bottomLeft: Radius.circular(15),
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15)));
