import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:project_management/app/utils/widgets/Widgets/products/product_details.dart';

import '../../../../common/widgets/loader.dart';
import '../../../../features/dashboard/models/product.dart';
import '../../../../features/dashboard/views/screens/product_details_screen.dart';
import '../../../services/admin_services.dart';
import 'single_product.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
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

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: 1200,
                height: 900,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: products!.length,
                  //gridDelegate:
                  //const SliverGridDelegateWithFixedCrossAxisCount(
                  // crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final productData = products![index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProductDetailsScreen.routeName,
                            arguments: productData,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Wrap(
                            children: [
                              SingleProduct(
                                image: productData.images[0],
                                name: productData.name,
                                price: productData.price,
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

                          // Wrap(
                          //   children: [
                          //     SizedBox(
                          //       width: 100,
                          //       height: 80,
                          //       child: Text(
                          //         productData.name,
                          //         overflow: TextOverflow.ellipsis,
                          //         maxLines: 2,
                          //       ),
                          //     ),
                          //     IconButton(
                          //       onPressed: () =>
                          //           deleteProduct(productData, index),
                          //       icon: const Icon(
                          //         Icons.delete_outline,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ));
                  },
                ),
                // floatingActionButton: FloatingActionButton(
                //   onPressed: navigateToAddProduct,
                //   tooltip: 'Add a Product',
                //   backgroundColor: GlobalVariables.secondaryColor,
                //   child: const Icon(Icons.add),
                // ),
                // floatingActionButtonLocation:
                //     FloatingActionButtonLocation.centerFloat,
              ),
            ],
          );
  }
}
