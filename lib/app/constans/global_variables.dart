import 'package:flutter/material.dart';

// String uri = 'https://amazon-clone-by-yoosuf.herokuapp.com/';
String uri = 'https://server-flutterm.herokuapp.com';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
      begin: AlignmentDirectional.topCenter,
      end: Alignment.bottomCenter,
      stops: [
        0.2,
        0.4,
        0.8
      ],
      colors: [
        (Color(0xff7F00F0)),
        Color.fromARGB(255, 165, 92, 179),
        Color.fromARGB(255, 247, 90, 114)
      ]);

  static const secondaryColor = Color.fromARGB(255, 162, 87, 223);
  static const backgroundColor = Color.fromARGB(255, 197, 209, 224);
  static const authBackgroundColor = Color.fromARGB(255, 255, 254, 254);
  static const starColor = Color.fromARGB(255, 238, 142, 146);
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = const Color.fromARGB(255, 138, 21, 192);
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://i0.wp.com/www.nativaselectta.com/wp-content/uploads/2020/07/MUNDO-GAMER-3-categorias-gamers.jpg?fit=850%2C638&ssl=1',
    'https://img.freepik.com/free-psd/fashion-sale-social-media-facebook-cover-template_233825-84.jpg?w=1380',
    'https://img.freepik.com/free-psd/digital-marketing-corporate-social-media-facebook-cover-template_233825-114.jpg?w=1380',
    'https://img.freepik.com/free-psd/fashion-sale-social-media-facebook-cover-template_233825-92.jpg?w=1380',
    'https://img.freepik.com/free-psd/home-sale-real-estate-social-media-facebook-cover-template_233825-218.jpg?w=1380',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobiles.jpeg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essentials.jpeg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpeg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpeg',
    },
  ];
}
