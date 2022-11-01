import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        CircleAvatar(
          radius: 25.0,
          backgroundColor: Color.fromARGB(255, 211, 211, 211),
          backgroundImage: AssetImage('assets/images/raster/avatar-1.png'),
        ),
        Text("admin@gmail.com"),
        Icon(Icons.notifications)
      ],
    );
  }
}
