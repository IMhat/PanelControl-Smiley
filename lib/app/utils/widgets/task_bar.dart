import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class TaskBar extends StatelessWidget {
  final textButtonStyle = TextButton.styleFrom(
    primary: const Color.fromARGB(255, 89, 89, 89),
    textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  );

  TaskBar({Key? key}) : super(key: key);
  // var _lista = ['To do', 'In progress', 'Done'];
  // String _vista = 'Seleccione un estado';

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
                MyButtonFilter(),
                // TextButton(
                //   style: textButtonStyle,
                //   onPressed: () { },
                //   child: const Text(
                //     'Filtrar',
                //   ),
                // ),
                const SizedBox(width: 50),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: (Color(0xff7F00F0)),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_to_drive_rounded,
                      color: (Color(0xff7F00F0)),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.present_to_all_outlined,
                      color: (Color(0xff7F00F0)),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyButtonFilter extends StatelessWidget {
  const MyButtonFilter();

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return _FilterDialog();
            });
        // Navigator.pushNamed(
        //   context,
        //   '',
        // );
      },
      // The custom button
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: AlignmentDirectional.topEnd,
              colors: [
                Color.fromARGB(255, 242, 133, 157),
                Color.fromARGB(255, 167, 79, 211)
              ]),
          borderRadius: BorderRadius.circular(8.0),
        ),
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
    return AlertDialog(
      content: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * .2,
        height: MediaQuery.of(context).size.height * .8,
        child: Column(
          children: [
            Text(
              "Filtrar",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.start,
            ),
            Divider(indent: 2, color: Colors.grey),
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
            Text(
              "Miembros",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.start,
            ),
            // Container(
            //             child: DropdownButton(
            //               items: _lista.map((String a) {
            //                 return DropdownMenuItem(value: a, child: Text(a));
            //               }).toList(),
            //               onChanged: (_value) => {
            //                 setState(() {
            //                   _vista = _value.toString();
            //                 })
            //               },
            //               hint: Text(
            //                 _vista,
            //                 style: TextStyle(color: Colors.black),
            //               ),
            //             ),
            //           ),
          ],
        ),
      ),
    );
  }
}
