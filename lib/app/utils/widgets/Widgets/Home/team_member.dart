import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TeamMember extends StatelessWidget {
  const TeamMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CircleAvatar(
          radius: 25.0,
          backgroundColor: Color.fromARGB(255, 211, 211, 211),
          backgroundImage: AssetImage('assets/images/raster/avatar-1.png'),
        ),
        CircleAvatar(
          radius: 25.0,
          backgroundColor: Color.fromARGB(255, 211, 211, 211),
          backgroundImage: AssetImage('assets/images/raster/avatar-2.png'),
        ),
        CircleAvatar(
          radius: 25.0,
          backgroundColor: Color.fromARGB(255, 211, 211, 211),
          backgroundImage: AssetImage('assets/images/raster/avatar-3.png'),
        ),
        CircleAvatar(
          radius: 25.0,
          backgroundColor: Color.fromARGB(255, 211, 211, 211),
          backgroundImage: AssetImage('assets/images/raster/avatar-4.png'),
        ),
        CircleAvatar(
          radius: 25.0,
          backgroundColor: Color.fromARGB(255, 211, 211, 211),
          backgroundImage: AssetImage('assets/images/raster/avatar-5.png'),
        ),
      ],
    );
  }
}
