import 'package:flutter/material.dart';

class TaskBar extends StatelessWidget {
  final textButtonStyle = TextButton.styleFrom(
    primary: const Color.fromARGB(255, 89, 89, 89),
    textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  );

  TaskBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 400),
      width: 1150,
      height: 80,
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 250,
            child: Container(
              decoration: const BoxDecoration(
                  color: (Color(0xff7F00F0)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const TextField(
                controller: null,
                decoration: InputDecoration(
                  hintText: "Search tasks",
                  hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                  icon: Icon(Icons.search, color: Colors.white),
                  suffixIcon: Icon(
                    Icons.file_download_outlined,
                    size: 20.00,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: 800,
            height: 50,
            child: Row(
              children: [
                TextButton(
                  style: textButtonStyle,
                  onPressed: () {},
                  child: const Text(
                    'Dashboard',
                  ),
                ),
                const SizedBox(width: 3),
                TextButton(
                  style: textButtonStyle,
                  onPressed: () {},
                  child: const Text(
                    'My Tasks',
                  ),
                ),
                const SizedBox(width: 3),
                TextButton(
                  style: textButtonStyle,
                  onPressed: () {},
                  child: const Text(
                    'Favorites',
                  ),
                ),
                const SizedBox(width: 3),
                TextButton(
                  style: textButtonStyle,
                  onPressed: () {},
                  child: const Text(
                    'Goals',
                  ),
                ),
                const SizedBox(width: 3),
                TextButton(
                  style: textButtonStyle,
                  onPressed: () {},
                  child: const Text(
                    'Points',
                  ),
                ),
                const SizedBox(width: 3),
                TextButton(
                  style: textButtonStyle,
                  onPressed: () {},
                  child: const Text(
                    'Sprints',
                  ),
                ),
                const SizedBox(width: 50),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 0, 130, 153),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_to_drive_rounded,
                      color: Color.fromARGB(255, 0, 130, 153),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.present_to_all_outlined,
                      color: Color.fromARGB(255, 0, 130, 153),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
