import 'package:flutter/material.dart';

import 'package:project_management/app/utils/widgets/Widgets/products/card_product_grid_View.dart';

import '../../../../common/widgets/loader.dart';
import '../../../../features/dashboard/models/product.dart';
import '../../../services/admin_services.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView({Key? key}) : super(key: key);

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
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
                height: 800,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: products!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      final productData = products![index];
                      return Column(
                        children: [
                          CardProductGrid(
                            image: productData.images[0],
                            name: productData.name,
                            price: productData.price,
                          ),
                          IconButton(
                            onPressed: () => deleteProduct(productData, index),
                            icon: const Icon(
                              Icons.delete_outline,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
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
