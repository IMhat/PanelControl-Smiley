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
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: currentWidth,
          height: 1200,
          child: Column(children: [
            const SizedBox(height: 20),
            Container(
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
            ),
            Wrap(
              children: [
                Container(
                  width: 400,
                  height: 400,
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
                Column(
                  children: [
                    Text(
                      widget.product.id!,
                    ),
                    Stars(rating: avgRating),
                    Text(
                      widget.product.name,
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      widget.product.price.toString(),
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                        width: 200,
                        child: Flex(
                          direction: Axis.vertical,
                          children: [Text(widget.product.description)],
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




// import 'package:project_management/app/constans/global_variables.dart';
// import 'package:project_management/app/features/dashboard/models/product.dart';
// import 'package:project_management/app/features/dashboard/providers/user_provider.dart';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:project_management/app/features/dashboard/views/screens/search_screen.dart';
// import 'package:provider/provider.dart';

// import '../../../../common/widgets/custom_button.dart';
// import '../../../../common/widgets/stars.dart';

// class ProductDetailsScreen extends StatefulWidget {
//   static const String routeName = '/product-details';

//   final Product product;

//   const ProductDetailsScreen({
//     Key? key,
//     required this.product,
//   }) : super(key: key);

//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }

// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   double avgRating = 0;
//   double myRating = 0;

//   @override
//   void initState() {
//     super.initState();
//     double totalRating = 0;
//     for (int i = 0; i < widget.product.rating!.length; i++) {
//       totalRating += widget.product.rating![i].rating;
//       if (widget.product.rating![i].userId ==
//           Provider.of<UserProvider>(context, listen: false).user.id) {
//         myRating = widget.product.rating![i].rating;
//       }
//     }

//     if (totalRating != 0) {
//       avgRating = totalRating / widget.product.rating!.length;
//     }
//   }

//   void navigateToSearchScreen(String query) {
//     Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: AppBar(
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: GlobalVariables.appBarGradient,
//             ),
//           ),
//           title:
//            Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 42,
//                   margin: const EdgeInsets.only(left: 15),
//                   child: Material(
//                     borderRadius: BorderRadius.circular(7),
//                     elevation: 1,
//                     child: TextFormField(
//                       onFieldSubmitted: navigateToSearchScreen,
//                       decoration: InputDecoration(
//                         prefixIcon: InkWell(
//                           onTap: () {},
//                           child: const Padding(
//                             padding: EdgeInsets.only(
//                               left: 6,
//                             ),
//                             child: Icon(
//                               Icons.search,
//                               color: Colors.black,
//                               size: 23,
//                             ),
//                           ),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         contentPadding: const EdgeInsets.only(top: 10),
//                         border: const OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(7),
//                           ),
//                           borderSide: BorderSide.none,
//                         ),
//                         enabledBorder: const OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(7),
//                           ),
//                           borderSide: BorderSide(
//                             color: Colors.black38,
//                             width: 1,
//                           ),
//                         ),
//                         hintText: 'Search Catalog',
//                         hintStyle: const TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 17,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 color: Colors.transparent,
//                 height: 42,
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 child: const Icon(Icons.mic, color: Colors.black, size: 25),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Row(
//           children: [
//             Container(
//               width: 200,
//               height: 200,
//               child: CarouselSlider(
//                 items: widget.product.images.map(
//                   (i) {
//                     return Builder(
//                       builder: (BuildContext context) => Image.network(
//                         i,
//                         fit: BoxFit.contain,
//                         height: 200,
//                       ),
//                     );
//                   },
//                 ).toList(),
//                 options: CarouselOptions(
//                   viewportFraction: 1,
//                   height: 300,
//                 ),
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         widget.product.id!,
//                       ),
//                       Stars(rating: avgRating),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 20,
//                     horizontal: 10,
//                   ),
//                   child: Text(
//                     widget.product.name,
//                     style: const TextStyle(fontSize: 15),
//                   ),
//                 ),

//                 Container(
//                   color: Colors.black12,
//                   height: 5,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: RichText(
//                     text: TextSpan(
//                       text: 'Deal Price: ',
//                       style: const TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       children: [
//                         TextSpan(
//                           text: 'Points: ${widget.product.price}',
//                           style: const TextStyle(
//                             fontSize: 22,
//                             color: Colors.red,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                     child: Flex(
//                   direction: Axis.vertical,
//                   children: [Text(widget.product.description)],
//                 )),
//                 Container(
//                   color: Colors.black12,
//                   height: 5,
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.all(10),
//                 //   child: CustomButton(
//                 //     text: 'Buy Now',
//                 //     onTap: () {},
//                 //   ),
//                 // ),
//                 const SizedBox(height: 10),
//                 // Padding(
//                 //   padding: const EdgeInsets.all(10),
//                 //   child: CustomButton(
//                 //     text: 'Add to Cart',
//                 //     onTap: addToCart,
//                 //     color: const Color.fromARGB(255, 40, 192, 252),
//                 //   ),
//                 // ),
//                 const SizedBox(height: 10),
//                 Container(
//                   color: Colors.black12,
//                   height: 5,
//                 ),
//                 // const Padding(
//                 //   padding: EdgeInsets.symmetric(horizontal: 10.0),
//                 //   child: Text(
//                 //     'Rate The Product',
//                 //     style: TextStyle(
//                 //       fontSize: 22,
//                 //       fontWeight: FontWeight.bold,
//                 //     ),
//                 //   ),
//                 // ),
//                 // RatingBar.builder(
//                 //   initialRating: myRating,
//                 //   minRating: 1,
//                 //   direction: Axis.horizontal,
//                 //   allowHalfRating: true,
//                 //   itemCount: 5,
//                 //   itemPadding: const EdgeInsets.symmetric(horizontal: 4),
//                 //   itemBuilder: (context, _) => const Icon(
//                 //     Icons.star,
//                 //     color: GlobalVariables.starColor,
//                 //   ),
//                 //   onRatingUpdate: (rating) {
//                 //     productDetailsServices.rateProduct(
//                 //       context: context,
//                 //       product: widget.product,
//                 //       rating: rating,
//                 //     );
//                 //   },
//                 // )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
