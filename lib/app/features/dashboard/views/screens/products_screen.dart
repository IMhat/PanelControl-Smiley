import 'package:flutter/material.dart';
import 'package:project_management/app/features/dashboard/models/product.dart';
import 'package:project_management/app/features/dashboard/views/screens/add_product_screen.dart';
import 'package:project_management/app/utils/widgets/sidebar/sidebar_products.dart';

import '../../../../common/widgets/loader.dart';
import '../../../../constans/global_variables.dart';
import '../../../../utils/services/admin_services.dart';
import '../../../../utils/widgets/single_product.dart';

class PostsScreen extends StatefulWidget {
  static const String routeName = '/get-product';
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {});
      },
    );
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  final textStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 255, 255, 255));
  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff48409E),
            ),
            body: SingleChildScrollView(
              child: Wrap(
                children: [
                  const SidebarProducts(),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(right: 40),
                        width: 1450,
                        height: 80,
                        decoration: _buildBoxDecoration1(),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20, top: 20),
                              width: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(children: [
                                    Text(
                                      "Productos",
                                      style: textStyle,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Uteam",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                            const SizedBox(width: 150),
                            const Text("Agrega productos al catálogo",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20)),
                            const SizedBox(width: 20),
                            Container(
                              child: const CircleAvatar(
                                radius: 25.0,
                                backgroundColor:
                                    Color.fromARGB(255, 211, 211, 211),
                                backgroundImage: AssetImage(
                                    'assets/images/raster/avatar-1.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        width: 800,
                        height: 600,
                        child: Scaffold(
                          body: GridView.builder(
                            itemCount: products!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (context, index) {
                              final productData = products![index];
                              return Column(
                                children: [
                                  SizedBox(
                                    width: 250,
                                    height: 140,
                                    child: SingleProduct(
                                      image: productData.images[0],
                                    ),
                                  ),
                                  Wrap(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        height: 80,
                                        child: Text(
                                          productData.name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () =>
                                            deleteProduct(productData, index),
                                        icon: const Icon(
                                          Icons.delete_outline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                          floatingActionButton: FloatingActionButton(
                            onPressed: navigateToAddProduct,
                            tooltip: 'Add a Product',
                            backgroundColor: GlobalVariables.secondaryColor,
                            child: const Icon(Icons.add),
                          ),
                          floatingActionButtonLocation:
                              FloatingActionButtonLocation.centerFloat,
                        ),
                      ),
                    ],
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
