import 'package:project_management/app/features/dashboard/models/tasks.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_management/app/utils/services/admin_services.dart';
import 'package:provider/provider.dart';

class TaskDetailsScreen extends StatefulWidget {
  static const String routeName = '/task-details';

  final Task task;

  const TaskDetailsScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final AdminServices productDetailsServices = AdminServices();

  // void acept() {
  //   productDetailsServices.accept(
  //     context: context,
  //     assignmentUser: widget.task.assignmentUser,
  //     category: widget.task.category,
  //     createdBy: widget.task.createdBy,
  //     description: widget.task.description,
  //     points: widget.task.points,
  //     priority: widget.task.priority,
  //     id: widget.task.id,
  //     title: widget.task.title,
  //     status: "inprogress",

  //     // Navigator.pushNamed(
  //     //   context,
  //     //   'ChallengeAcepted',
  //     // );
  //   );
  //   Navigator.pushNamed(
  //     context,
  //     'ChallengeAcepted',
  //   );
  // }

  // double avgRating = 0;
  // double myRating = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   double totalRating = 0;
  //   for (int i = 0; i < widget.product.rating!.length; i++) {
  //     totalRating += widget.product.rating![i].rating;
  //     if (widget.product.rating![i].userId ==
  //         Provider.of<UserProvider>(context, listen: false).user.id) {
  //       myRating = widget.product.rating![i].rating;
  //     }
  //   }

  //   if (totalRating != 0) {
  //     avgRating = totalRating / widget.product.rating!.length;
  //   }
  // }

  // void navigateToSearchScreen(String query) {
  //   Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  // }

  // void addToCart() {
  //   productDetailsServices.addToCart(
  //     context: context,
  //     product: widget.product,
  //   );
  // }
  final elevatedButtonStyle = ElevatedButton.styleFrom(
      shadowColor: const Color.fromARGB(255, 54, 57, 244),
      elevation: 10,
      primary: Colors.deepPurple,
      onPrimary: Colors.white);

  final buttonStyleDowload = ElevatedButton.styleFrom(
      elevation: 0,
      primary: const Color.fromARGB(255, 255, 255, 255),
      onPrimary: const Color.fromARGB(255, 0, 34, 255));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(top: 20, right: 130),
              width: 350,
              height: 60,
              child: Text(
                widget.task.title,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                padding: const EdgeInsets.only(right: 20),
                width: 400,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Para"),
                    Container(
                      width: 250,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(50)),
                      child: Stack(
                        children: [
                          LayoutBuilder(
                              builder: (context, constraints) => Container(
                                    width: constraints.maxWidth * 10,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 199, 197, 198),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  )),
                          Positioned.fill(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 25.0,
                                  backgroundImage:
                                      AssetImage('assets/user.png'),
                                ),
                                Text(
                                  widget.task.assignmentUser,
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(left: 200),
              padding: const EdgeInsets.only(top: 5),
              width: 120,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 251, 251)),
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                widget.task.status,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              width: 340,
              height: 200,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromARGB(255, 0, 21, 255)),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                widget.task.description,
                style: const TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 9, 0, 0)),
              ),
            ),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.only(left: 0),
                width: 500,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("34 MB"),
                    ElevatedButton(
                      style: buttonStyleDowload,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '',
                        );
                      },
                      child: const Text("Dowload"),
                    ),
                  ],
                )),
            Container(
                padding: const EdgeInsets.only(left: 0),
                width: 500,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("Aa",
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                    Icon(Icons.emoji_emotions_outlined),
                    Icon(Icons.attach_file),
                    Icon(Icons.today_outlined),
                    Text(
                      "vence 10/10/22",
                      style: TextStyle(color: Colors.red),
                    ),
                    Icon(Icons.person_add)
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(left: 100),
              child: Row(
                children: [
                  Text(
                    ' ${widget.task.points}',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    " Puntos",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 27, 112, 248)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 80),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: AlignmentDirectional.topEnd,
                          colors: [
                            Color.fromARGB(255, 242, 133, 157),
                            Color.fromARGB(255, 167, 79, 211),
                          ]),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // widget.task.assignmentUser;
                        // widget.task.category;
                        // widget.task.createdBy;
                        // widget.task.description;
                        // widget.task.points;
                        // widget.task.priority;
                        // widget.task.id;
                        // widget.task.title;
                        // widget.task.status = "inprogress";
                        // productDetailsServices.updateTask(widget.task,
                        //     context: context);
                        // acept();
                      },
                      child: const Text(
                        "Aceptar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: AlignmentDirectional.topEnd,
                          colors: [
                            Color.fromARGB(255, 242, 164, 133),
                            Color.fromARGB(255, 255, 0, 0),
                          ]),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          'ChallengeAcepted',
                        );
                      },
                      child: const Text(
                        "Rechazar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

//  Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: AppBar(
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: GlobalVariables.appBarGradient,
//             ),
//           ),
//           title: Row(
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
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     widget.task.status,
//                   ),
//                   // Stars(rating: avgRating),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 20,
//                 horizontal: 10,
//               ),
//               child: Text(
//                 widget.task.title,
//                 style: const TextStyle(fontSize: 15),
//               ),
//             ),
//             // CarouselSlider(
//             //   items: widget.product.images.map(
//             //     (i) {
//             //       return Builder(
//             //         builder: (BuildContext context) => Image.network(
//             //           i,
//             //           fit: BoxFit.contain,
//             //           height: 200,
//             //         ),
//             //       );
//             //     },
//             //   ).toList(),
//             //   options: CarouselOptions(
//             //     viewportFraction: 1,
//             //     height: 300,
//             //   ),
//             // ),
//             Container(
//               color: Colors.black12,
//               height: 5,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8),
//               child: RichText(
//                 text: TextSpan(
//                   text: 'Deal Price: ',
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   children: [
//                     TextSpan(
//                       text: 'Points: ${widget.task.points}',
//                       style: const TextStyle(
//                         fontSize: 22,
//                         color: Colors.red,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(widget.task.description),
//             ),
//             Container(
//               color: Colors.black12,
//               height: 5,
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.all(10),
//             //   child: CustomButton(
//             //     text: 'Buy Now',
//             //     onTap: () {},
//             //   ),
//             // ),
//             const SizedBox(height: 10),
//             // Padding(
//             //   padding: const EdgeInsets.all(10),
//             //   child: CustomButton(
//             //     text: 'Add to Cart',
//             //     onTap: addToCart,
//             //     color: const Color.fromARGB(255, 40, 192, 252),
//             //   ),
//             // ),
//             const SizedBox(height: 10),
//             Container(
//               color: Colors.black12,
//               height: 5,
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.0),
//               child: Text(
//                 'Rate The Product',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             // RatingBar.builder(
//             //   initialRating: myRating,
//             //   minRating: 1,
//             //   direction: Axis.horizontal,
//             //   allowHalfRating: true,
//             //   itemCount: 5,
//             //   itemPadding: const EdgeInsets.symmetric(horizontal: 4),
//             //   itemBuilder: (context, _) => const Icon(
//             //     Icons.star,
//             //     color: GlobalVariables.starColor,
//             //   ),
//             //   onRatingUpdate: (rating) {
//             //     productDetailsServices.rateProduct(
//             //       context: context,
//             //       product: widget.product,
//             //       rating: rating,
//             //     );
//             //   },
//             // )
//           ],
//         ),
//       ),
//     );
//   }
