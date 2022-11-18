import 'package:flutter/foundation.dart';
import 'package:project_management/app/constans/global_variables.dart';
import 'package:project_management/app/features/dashboard/models/product.dart';
import 'package:project_management/app/features/dashboard/providers/user_provider.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_management/app/features/dashboard/views/screens/search_screen.dart';
import 'package:project_management/app/utils/widgets/sidebar/sidebar_products.dart';
import 'package:provider/provider.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/stars.dart';
import '../../../../constans/app_constants.dart';
import '../../../../shared_components/responsive_builder.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = '/product-details';

  final Product product;

  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

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
          return Column(children: [
            const SizedBox(height: kSpacing * (kIsWeb ? 1 : 2)),
            ProductDetails(
              product: widget.product,
            ),
          ]);
        },
        tabletBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: (constraints.maxWidth < 950) ? 6 : 9,
                  child: ProductDetails(
                    product: widget.product,
                  )),
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
              Flexible(
                  flex: 9,
                  child: ProductDetails(
                    product: widget.product,
                  )),
            ],
          );
        },
      )),
    );
  }
}

class ProductDetails extends StatefulWidget {
  static const String routeName = '/product-details';

  final Product product;

  const ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }

    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: currentWidth,
          height: 1200,
          child: Column(children: [
            const SizedBox(height: 20),
            headerProductDetail(),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, left: 200),
                  width: 300,
                  height: 300,
                  child: CarouselSlider(
                    items: widget.product.images.map(
                      (i) {
                        return Builder(
                          builder: (BuildContext context) => Image.network(
                            i,
                            fit: BoxFit.contain,
                            height: 200,
                          ),
                        );
                      },
                    ).toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: 300,
                    ),
                  ),
                ),
                const SizedBox(width: 150),
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 80,
                      child: Text(
                        widget.product.id!,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 80,
                      child: Text(
                        widget.product.name,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        widget.product.price.toString(),
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 150, child: Stars(rating: avgRating)),
                    Container(
                        width: 200,
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            Text(
                              widget.product.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Container headerProductDetail() {
    return Container(
      margin: const EdgeInsets.only(right: 40),
      width: 1450,
      height: 80,
      decoration: _buildBoxDecoration1(),
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.all(25),
            width: 350,
            height: 50,
            child: const Text("Product Datail",
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
