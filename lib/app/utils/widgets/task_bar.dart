import 'dart:html';

import 'package:flutter/material.dart';


class TaskBar extends StatelessWidget {
  final textButtonStyle = TextButton.styleFrom(
    primary: Colors.white,
    textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  );

  TaskBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1550,
      height: 60,
      color: const Color(0xff48409E),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 24,
            width: 250,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const TextField(
                controller: null,
                decoration: InputDecoration(
                  hintText: "Search tasks",
                  hintStyle: TextStyle(color: Color(0xff6F6F6F), fontSize: 15),
                  icon: Icon(Icons.search, color: Color(0xff6F6F6F)),
                  // suffixIcon: Icon(
                  //   Icons.file_download_outlined,
                  //   size: 20.00,
                  // ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 1,
            height: 20,
            color: Colors.white,
          ),
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
                const MyButtonFilter(),
                // TextButton(
                //   style: textButtonStyle,
                //   onPressed: () { },
                //   child: const Text(
                //     'Filtrar',
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(width: 350),
          const SizedBox(
            child: Text(
              "Admin",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 5),
          const CircleAvatar(
            radius: 25.0,
            backgroundColor: Color.fromARGB(255, 211, 211, 211),
            backgroundImage: AssetImage('assets/images/raster/avatar-1.png'),
          ),
        ],
      ),
    );
  }
}

class MyButtonFilter extends StatefulWidget {
  const MyButtonFilter();

  @override
  State<MyButtonFilter> createState() => _MyButtonFilterState();
}

class _MyButtonFilterState extends State<MyButtonFilter> {
  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return const _FilterDialog();
            });
        // Navigator.pushNamed(
        //   context,
        //   '',
        // );
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(12.0),
        // decoration: BoxDecoration(
        //   gradient: const LinearGradient(
        //       begin: AlignmentDirectional.topEnd,
        //       colors: [
        //         Color.fromARGB(255, 242, 133, 157),
        //         Color.fromARGB(255, 167, 79, 211)
        //       ]),
        //   borderRadius: BorderRadius.circular(8.0),
        // ),
        child: const Text(
          'Filter',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _FilterDialog extends StatelessWidget {
  const _FilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _lista = ['To do', 'In progress', 'Done'];
    String _vista = 'Seleccione un miembro';
    return AlertDialog(
      content: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * .2,
        height: MediaQuery.of(context).size.height * .8,
        child: Column(
          children: [
            const Text(
              "Filtrar",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.start,
            ),
            const Divider(indent: 2, color: Colors.grey),
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 87, 86, 86),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const TextField(
                controller: null,
                decoration: InputDecoration(
                  hintText: "Search tasks",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                  icon: Icon(Icons.search, color: Colors.black),
                  suffixIcon: Icon(
                    Icons.file_download_outlined,
                    size: 20.00,
                  ),
                ),
              ),
            ),
            const Text(
              "Miembros",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.start,
            ),
            DropdownButton(
              items: _lista.map((String a) {
                return DropdownMenuItem(
                    value: a,
                    child: Text(
                      a,
                      style: const TextStyle(color: Colors.black),
                    ));
              }).toList(),
              onChanged: (_value) => {
                setState(() {
                  _vista = _value.toString();
                })
              },
              hint: Text(
                _vista,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  setState(Function() param0) {}
}
